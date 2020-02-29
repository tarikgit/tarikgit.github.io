#!/bin/bash

# We have to make it an executable file by changing the permissions.
# chmod u+x compile-latex.sh

latex $1".tex" &
latex $1".tex" &
latex $1".tex" &
dvips $1".dvi" &

#ps2pdf $1".ps"
#evince $1".pdf" &
