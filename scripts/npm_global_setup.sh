mkdir ~/.npm-global
touch ~/.npmrc
echo "prefix=~/.npm-global" > ~/.npmrc
echo "export PATH=\"\$HOME/.npm-global/bin:\$PATH\"" >> ~/.bash_profile
