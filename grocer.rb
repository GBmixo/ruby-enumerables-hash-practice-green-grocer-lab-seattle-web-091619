def consolidate_cart(cart)
  new_hash = {}
  
  cart.each {|item_hash|
    item_name = item_hash.keys[0]
    item_stats = item_hash.values[0]
    #p item_name
    
    if new_hash.has_key?(item_name)
      new_hash[item_name][:count] += 1
    else
      new_hash[item_name] = {
        price: item_stats[:price],
        clearance: item_stats[:clearance],
        count: 1
      }  
    end
  }
  p new_hash
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    item = coupon[:item]
    if cart[item] && cart[item][:count] >= coupon[:num] && cart.has_key?("#{item} W/COUPON")
      cart["#{item} W/COUPON"] = {
        price: coupon[:cost] / coupon[:num], clearance: cart[item][:clearance], count: coupon[:num]
      }
      cart[item][:count] -= coupon[:num]
    else if coupon[item][:count] >= coupon[:num] && cart["#{item} W/COUPON"]
      cart["#{item} W/COUPON"][:count] += coupon[:num]
      cart[item][:count] -= count[:num]
    end
  end
  p cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end

end
