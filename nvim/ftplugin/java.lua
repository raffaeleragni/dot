-- If you started neovim within `~/dev/xy/project-1` this would resolve to `project-1`
local fn = vim.fn
local project_name = fn.fnamemodify(fn.getcwd(), ':p:h:t')
local home_dir = os.getenv('HOME')
local nvim_dir = home_dir..'/.config/nvim'
local workspace_root_dir = nvim_dir..'/workspace/'
local workspace_dir = workspace_root_dir..project_name
local launcher_jar = fn.expand(home_dir..'/.local/share/nvim/lsp_servers/jdtls/plugins/org.eclipse.equinox.launcher_*.jar')

local file_exist = function(path)
  local f = io.open(path, 'r')
  return f ~= nil and io.close(f)
end

local get_lombok_javaagent = function()
  local lombok_dir = home_dir..'/.m2/repository/org/projectlombok/lombok/'
  local lombok_versions = io.popen('ls -1 "' .. lombok_dir .. '" | sort -r | head -n1')
  if lombok_versions ~= nil then
    version = lombok_versions:read()
    lombok_versions:close()
    local lombok_jar = fn.expand(string.format('%s%s/lombok-%s.jar', lombok_dir, version, version))
    if file_exist(lombok_jar) then
      return string.format('--jvm-arg=-javaagent:%s', lombok_jar)
    end
  end
  return ''
end

local get_cmd = function()
  local cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', launcher_jar,
    '-configuration', home_dir..'/.local/share/nvim/lsp_servers/jdtls/config_linux',
  }

  local lombok_javaagent = get_lombok_javaagent()
  if (lombok_javaagent ~= '') then
    table.insert(cmd, lombok_javaagent)
  end

  table.insert(cmd, '-data')
  table.insert(cmd, workspace_dir)

  return cmd
end

local config = {
  cmd = get_cmd(),
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
  flags = {
    allow_incremental_sync = true,
    debounce_text_changes = 150,
    server_side_fuzzy_completion = true
  },
}
require('jdtls').start_or_attach(config)

