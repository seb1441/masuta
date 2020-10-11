class StripeServices::ImportProduct
  def initialize(object_data)
    @object_data = object_data.with_indifferent_access
    @object_data["s_type"] = @object_data.delete("type") # Should not name a column "type" in Rails
    @object_data["s_attributes"] = @object_data.delete("attributes") # Should not name a column "attributes" in Rails
  end

  def call
    if stripe_product = StripeProduct.find_by_id(@object_data["id"])
      update(stripe_product)
    else
      create
    end
  end

  private

  def create
    StripeProduct.create(@object_data)
  end

  def update(stripe_product)
    stripe_product.update(@object_data)
  end
end