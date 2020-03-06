#!/bin/bash

# We have to make it an executable file by changing the permissions.
# chmod u+x compile-latex.sh

latex -shell-escape $1".tex" &
latex -shell-escape $1".tex" &
latex -shell-escape $1".tex" &
dvips $1".dvi" &

ps2pdf $1".ps"
#evince $1".pdf" &

#mv *.aux files/
#mv *.dvi files/
#mv *.log fles/
#mv *.ps files/