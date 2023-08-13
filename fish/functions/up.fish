function up
    # update leazy
    cd ~/_michondr/leazy/
    git up

    # update dcds
    cd ~/_autix/dcds/
    git co master
    git up
    git co -

    # update autix
    cd ~/_autix/autodevelo
    git co develop
    git up
    git co -
end
