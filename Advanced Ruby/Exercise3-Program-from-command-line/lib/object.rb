class Object
  def make_method(method_name, code)
    begin
    raise "Method name not proper" if method_name !~ /^[a-z][^\s]*$/
      instance_eval %{
        def #{ method_name } 
          #{ code } 
        end
      }
    rescue Exception
      abort "Quiting Program"
    end
  end
end
