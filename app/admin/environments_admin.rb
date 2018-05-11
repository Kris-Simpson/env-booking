Trestle.resource(:environments) do
  menu do
    item :environments, icon: "fa fa-star"
  end

  # Customize the table columns shown on the index view.
  #
  # table do
  #   column :name
  #   column :created_at, align: :center
  #   actions
  # end

  form do |environment|
    row do
      col(sm: 6) { text_field :name }
    end
  end
end
