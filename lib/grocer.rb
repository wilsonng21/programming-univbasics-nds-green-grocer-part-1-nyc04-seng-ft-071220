require 'pry'

def find_item_by_name_in_collection(name, collection) #name = string, collection = array of hashes
  # 1-set item_found to nil as default, iterate through collection.
  # 2-check each item name and name from argument.
  # 3-if condition passes item_found gets assigned the item hash.
  # 4-else item_found will still as nil.
  item_found = nil
  collection.each do |item_hash|
    if item_hash[:item] == name
      item_found = item_hash
    end
  end
  item_found
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  new_obj = []
  cart.each do |item_hashes|
    # iterating through cart data, getting access to item_hashes.
    # adding :count key and setting it to 0 for all item_hashes.
    # grabbed the string from item and assigned it to item_name.
    # check to see if new_obj has the hash, if true, the :count key will icrement by 1.
    # if new_obj doesn't have the item hash, the item hash will get shoved into new_obj array as well set :count to 1.
    item_hashes[:count] = 0
    item_name = item_hashes[:item]
    if new_obj.include?(item_hashes)
      item_hashes[:count] += 1
    end
    if !new_obj.include?(item_hashes)
      new_obj << find_item_by_name_in_collection(item_name, cart)
      new_obj
    end
    item_hashes[:count] += 1
  end
end

