#/bin/bash

BASEDIR=~/go/src/github.com/pltanton
PLUGINS=( $BASEDIR/yags-kbdd $BASEDIR/yags-volume $BASEDIR/yags-stdin $BASEDIR/yags-battery $BASEDIR/yags-timer/cmd $BASEDIR/yags-timer/time $BASEDIR/yags-timer/wifi )

echo "Install yagis itself"
cd $BASEDIR/yags
go install

function build_plugin {
    echo Start build of $1
    cd $plugin_dir
    go build -buildmode=plugin
    echo Build of $1 finished
}

echo "Building plugins in multiple threads"
for plugin_dir in ${PLUGINS[@]}; do
    build_plugin $plugin_dir &
done

wait
echo "Building of plugins finished"
