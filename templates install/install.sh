
#!/bin/bash


unzip Templates.zip


which -s brew
if [[ $? != 0 ]] ; then
read -p " BREW isn't installed. Do You want to install it? " -n 1 -r
echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
    echo "Abort"
    exit
    fi
fi

if pod --version; then
echo "PODs installed - continue"
else
read -p " PODs isn't installed. Do You want to install it? " -n 1 -r
echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
    sudo gem install cocoapods
    else
    echo "Abort"
    exit
    fi
fi

brew tap liftoffcli/formulae
brew install liftoff

mv ./.liftoff ~/
mv ./.liftoffrc ~/

rm -rf __MACOSX
rm -rf ./.liftoff
rm -rf ./.liftoffrc

echo 
read -p "Do You want to open lift off man? " -n 1 -r
echo    
if [[ $REPLY =~ ^[Yy]$ ]]
then
    man liftoffrc
fi
