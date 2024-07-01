function add_to_cart(pid, pname, price) {
	let cart = localStorage.getItem("cart");
	if (cart == null) {
		//no cart yet
		let products = [];
		let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: price }
		products.push(product);
		localStorage.setItem("cart", JSON.stringify(products));
		//console.log("product is add first time")
		showToast("Item is Added to Cart")
	} else {

		//card is already presents

		let pcart = JSON.parse(cart);
		let oldProduct = pcart.find((item) => item.productId == pid)
		if (oldProduct)
		 {
			//we have to increase the quantity
			
			oldProduct.productQuantity = oldProduct.productQuantity + 1
			pcart.map((item) => {

				if (item.productId == oldProduct.ProductId)
				 {
					item.productQuantity = oldProduct.productQuantity;
				}
				localStorage.setItem("cart", JSON.stringify(pcart));

				console.log("product quantity increase")
				showToast(oldProduct.productName+"quantity is increased,Quantity :"+oldProduct.productQuantity)

               })
			
		} else {
			//we have add the product
			let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: price }
			pcart.push(product);
			localStorage.setItem("cart", JSON.stringify(pcart));
			console.log("product is added")
			showToast("Product is Added to Cart");


		}

	}
 
 

 	updateCart();
 	 
 	 
 	 
}
//update cart
function updateCart() {
	let cartString = localStorage.getItem("cart");
	let cart = JSON.parse(cartString);
	if (cart == null || cart.length == 0) 
	{
		console.log("cart is empty")
		$(".cart-items").html("(0)");
		$(".cart-body").html("<h3>Cart does not have any item</h3>");
		$(".checkout-btn").attr('disabled',true)
	}
	else {
		//there is some item in cart
		console.log(cart)
	$(".cart-items").html(`(${cart.length})`);
	let table=`
	<table class='table'>
	<thead class='thread-light'>
	<tr>
	<th>Item Name</th>
	<th>Price</th>
	<th>Quantity</th>
	<th>Total Price</th>
	<th>Action</th>
	<tr>
	</thead>
	
	`;
	totalPrice=0;
		cart.map((item) => {

			table +=`
				<tr>
					<td>${item.productName}</td>
					<td>${item.productPrice}</td>
					<td>${item.productQuantity}</td>
					<td>${item.productQuantity*item.productPrice}</td>
					<td> <button onclick='deleteItemfromCart(${item.productId})' class='btn btn-danger btn-sm'>Remove</button></td>

				</tr>`
			totalPrice+=item.productPrice*item.productQuantity;	
		})
	      
		table = table + `
		<tr><td colspan='5' class='text-right font-weight-bold m-5'>Total Price:${totalPrice}</td></tr>
		</table>`
		$(".cart-body").html(table);
		//$(".checkout-btn").attr('disabled',false)		
		$(".checkout-btn").removeClass('disabled');

		console.log("removed")


	}
}
//delete item
function deleteItemfromCart(pid)
{
	let cart=JSON.parse(localStorage.getItem('cart'));
	let newcart=cart.filter((item)=>item.productId !=pid)
	localStorage.setItem('cart',JSON.stringify(newcart))
	updateCart();
			showToast("Item is Removed from Cart");

}


$(document).ready(function() {

	updateCart();
})
 //toast message
function showToast(content){
	$("#toast").addClass("display");
	$("#toast").html(content);
	setTimeout(()=>{
		$("#toast").removeClass("display");
		},2000);
	}
	
	//checkout button
	function GoToCheckout()
	{
     window.location="checkout.jsp";
 	}
	