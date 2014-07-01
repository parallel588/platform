CATEGORY_NAMES = ["Fruits", "Vegetables"]
SUBCATEGORY_NAMES = [["Apples", "Oranges", "Strawberies"], ["Tomatos", "Potatos", "Cucumbers"]]


CATEGORY_NAMES.each_with_index do |category_name, i|
    category = ProductCategory.create(name: category_name)
    SUBCATEGORY_NAMES[i].each do |subcategory| 
      ProductCategory.create(name: subcategory, parent: category)
    end
end


# # Create Products with Auctions
# 6.times do |i|
#   product = Product.create({
#     name: "Product ##{i}", 
#     description: "The ##{i} product created by seed data.",    
#   })
#   auction = Auction.create({
#     product: product,
#     starting_at: Time.now - i.days,
#     ending_at: Time.now + i.days + i.months
#     starting_bid: 5*i+1
#     bid_increment: i+1
#     buy_out_bid: i%2 == 0 ? nil : 10*i
#   })
# end

# Auction.all.each do |auction|
#   Bidding.create({
#     auction: auction,
    
    
#   })
# end