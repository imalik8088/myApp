module ApplicationHelper
  

  def bundeslaender
    [
     ['Hessen'], ['Bayern'], ['Sachsen'], ['Hamburg'], 
     ['Berlin'], ['Bremen'], ["Schleswig-Holstein"], ["Brandenburg"],
     ["Niedersachsen"], ["Baden-Wüttemberg"], ["Saarland"], ["Thüringen"], 
     ["Nordrhein-Westfalen"], ["Mecklenburg-Vorpommern"], ["Sachsen-Anhalt"], ["Rheinland-Pfalz"]
    ]
  end
    
  def german_date(date)
  	return date.strftime("%d.%m.%Y")
  end
end
