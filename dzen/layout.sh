if [ $(xkblayout-state print '%c') -eq 0 ]; then
    echo en
else
    echo ru
fi

