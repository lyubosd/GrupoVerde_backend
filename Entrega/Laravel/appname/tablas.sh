
declare -a tablas=('token' 'supplier' 'promotion' 'productHasPromotion' 'product' 'photo' 'payment' 'orderdetails' 'orders' 'customer' 'category' 'proveedor' 'admin' 'customerHasPhoto' 'photo_has_category' 'product_has_category');
for i in "${tablas[@]}"
do
php artisan make:model $i -mrc
done
