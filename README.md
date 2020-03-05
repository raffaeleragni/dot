# dot

Works in bash.
Creates a bin folder in home.
Links all files in ~/.dot/bin to the home bin folder

```
git clone git@github.com:raffaeleragni/dot.git ~/.dot
echo 'for file in ~/.dot/*.bashrc; do source "$file"; done' >> ~/.bashrc
source ~/.bashrc
```
