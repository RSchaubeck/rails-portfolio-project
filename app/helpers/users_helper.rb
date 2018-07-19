module UsersHelper
  def get_first_name(full_name)
    name_arr = full_name.split(" ")
    name_arr[0]
  end

  def get_last_name(full_name)
    name_arr = full_name.split(" ")
    name_arr[name_arr.length - 1]
  end
end
