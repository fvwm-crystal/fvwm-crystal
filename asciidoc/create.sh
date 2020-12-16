#!/bin/bash

asciidoc_files=(fvwm-crystal ApplicationDatabase CrystalRoxHOWTO FAQ KeyboardBindings MouseBindings Tips)

dodoc() {
    a2x -vf manpage $1
    if [[ $? != "0" ]]; then exit 1; fi
    echo -e "\n**************************************************************************"
    echo -e "**************************************************************************\n"
    asciidoc -v $1
    if [[ $? != "0" ]]; then exit 1; fi

}

controldoc() {
    for name in ${asciidoc_files[*]}
    do
        dodoc ${name}
    done
    for name in *.1
    do
        mv ${name} ../man/${name}
    done

    for name in *.html
    do
        mv ${name} ../doc/html/${name}
    done
}

if [ $# -eq 0 ]
then
    controldoc
else
    dodoc $1
    mv *.1 ../man
    mv $1.html ../doc/html/$1.html
fi
