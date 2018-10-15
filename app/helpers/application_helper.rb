module ApplicationHelper
  def user_gender(sex)
    if sex == "1"
        "男生"
     elsif sex=="0"
        "女生"
     else
        "其他"
     end   
  end

  def coursereview_agree(value)
    if  value == "5" 
      "非常同意"
    elsif  value == "4" 
      "同意"
    elsif  value == "3"
      "普通"
    elsif  value == "2" 
      "不同意"
    elsif  value == "1" 
      "非常不同意"
    else 
      "尚未作答"
    end 
    
  end
end
