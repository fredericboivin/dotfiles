def bt
  caller.select do |line|
    line.start_with?("/home/spin/src/github.com/Shopify/shopify/components") && !line.include?("/instrumentation/")
  end
end
