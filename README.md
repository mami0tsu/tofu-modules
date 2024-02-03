# tofu-modules

```bash
# mise
brew install mise
echo 'export MISE_ENV_FILE=.env' >> "${PATH_TO_ZDOTDIR}/.zshrc"
echo 'eval "$(mise activate zsh)"' >> "${PATH_TO_ZDOTDIR}/.zshrc"
zsh

# OpenTofu
brew tap tofuutils/tap
brew install tofuenv
cd tofu
tofuenv install
```
