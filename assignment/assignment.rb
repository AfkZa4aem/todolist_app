require_relative '../config/environment'

# Use Active Record Model methods to implement the following methods.
class Assignment

  #
  # Insert rows in DB
  #
  def create_user(params)
    @user = User.create(username: params[:username], password_digest: params[:password_digest])
  end

  def create_todolist(params)
    @list = TodoList.create(list_name: params[:name], list_due_date: params[:due_date])
  end

  #
  # Retrieve paginated results from DB
  #
  def find_allusers(offset, limit)
    @find = User.all.offset(offset).limit(limit).order(updated_at: :asc)
  end

  def find_alllists(offset, limit)
     @find = TodoList.all.offset(offset).limit(limit).order(list_due_date: :desc)
  end

  #
  # Query DB with exact match
  #
  def find_user_byname(username)
     @find = User.where(username: username)
  end 

  def find_todolist_byname(name)
      @find = TodoList.where(list_name: name)
  end     

  #
  # Get rows from DB by PK
  #
  def get_user_byid(id)
      @get = User.find_by(id: id)
  end

  def get_todolist_byid(id)
      @get = TodoList.find_by(id: id)
  end

  #
  # Update rows in DB
  #
  def update_password(id, password_digest)
      User.find_by(id: id).update(password_digest: password_digest)
  end

  def update_listname(id, name)
      TodoList.find_by(id: id).update(list_name: name)
  end 

  #
  # Delete rows from DB
  #
  def delete_user(id)
      User.delete(id)
  end 

  def delete_todolist(id)
      delete = TodoList.find_by(id: id)
      delete.destroy
  end
end
