execute pathogen#infect()

syntax on
set number

colorscheme nord

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

call maktaba#plugin#Install(maktaba#path#Join([maktaba#Maktaba().location,
    \ 'examples', 'helloworld']))

call glaive#Install()
