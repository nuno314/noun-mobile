if [ "$1" = "core" ]; then
    echo "================== Module Generator In Core =================="
    cd core; dart run module_generator; cd ../
fi
if [ "$1" = "customer" ]; then
    echo "================== Module Generator In Customer =================="
    cd customer; dart run module_generator; cd ../
fi
if [ "$1" = "staff" ]; then
    echo "================== Module Generator In Staff =================="
    cd staff; dart run module_generator; cd ../
fi