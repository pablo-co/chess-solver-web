require "administrate/base_dashboard"

class PieceDashboard < Administrate::BaseDashboard

  # This method returns a hash
  # that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  def attribute_types
    {
      id: :integer,
      kind: :integer,
      color: :integer,
      x: :integer,
      y: :integer,
      boardable_id: :integer,
      boardable_type: :string,
      created_at: :datetime,
      updated_at: :datetime,
      board: :belongs_to,
    }
  end

  # This method returns an array of attributes
  # that will be displayed on the model's index page.
  def table_attributes
    attributes
  end

  # This method returns an array of attributes
  # that will be displayed on the model's show page
  def show_page_attributes
    attributes
  end

  # This method returns an array of attributes
  # that will be displayed on the model's form pages (`new` and `edit`)
  def form_attributes
    attributes - read_only_attributes
  end

  private

  def attributes
    [
      :id,
      :kind,
      :color,
      :x,
      :y,
      :boardable_id,
      :boardable_type,
      :created_at,
      :updated_at,
      :board,
    ]
  end

  def read_only_attributes
    [
      :id,
      :created_at,
      :updated_at,
    ]
  end
end
