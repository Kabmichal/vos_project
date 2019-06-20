module StatisticsHelper
  def animal_calories
    @all_animal_food_chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "All animals calories graph")
      f.xAxis(name: "Time", categories: @animal_calories.map{|s| s["type"]})
      f.series(name: "Avarage of all animals ", yAxis: 0, data: @animal_calories.map{|s| s["cround"].to_i})
      f.legend(align: 'right', verticalAlign: 'top', y: 175, x: -15, layout: 'vertical')
      f.yAxis [
                  {title: {text: "Number of calories", margin: 30} }
              ]
      f.chart({defaultSeriesType: "column"})
    end
  end
  def just_try
    @just_try = LazyHighCharts::HighChart.new('graph') do |k|
      k.title(text: "Animal food  graph")
      k.xAxis(name: "Time", categories: @try.map{|s| s["current_date"]})
      k.series(name: "Number ",yAxis: 0, data: @try.map{|s| s["floor"].to_i})
      k.series(name: "Number ", yAxis: 0, data: @animal_calories.map{|s| s["cround"]})
      k.series(name: "Number ", yAxis: 0, data: [2,3,4])
      k.series(name: "Number ", yAxis: 0, data: [4,9,8,9])
      k.legend(align: 'right', verticalAlign: 'top', y: 175, x: -15, layout: 'vertical')
      k.yAxis [
                  {title: {text: "NUmber of calories", margin: 30} }
              ]
      k.chart({defaultSeriesType: "column"})
    end
  end
  def my_animal_foods
    @my_animal_foods = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "My animals calories graph")
      f.xAxis(name: "Time", categories: @my_animal_calories.map{|s| s["type"]})
      f.series(name: "Avarage of my animals", yAxis: 0, data:@my_animal_calories.map{|s| s["output"].to_i})
      f.legend(align: 'right', verticalAlign: 'top', y: 175, x: -15, layout: 'vertical')
      f.yAxis [
                  {title: {text: "Number of calories", margin: 30} }
              ]
      f.chart({defaultSeriesType: "column"})
    end
  end
  def number_of_food
    @number_of_foods_day = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "Food counter")
      f.xAxis(name: "Time", categories: @number_of_foods_day.map{|s| s["date"]})
      f.series(name: "Number of food", yAxis: 0, data:@number_of_foods_day.map{|s| s["sum"].to_i})
      f.legend(align: 'right', verticalAlign: 'top', y: 175, x: -15, layout: 'vertical')
      f.yAxis [
                  {title: {text: "Number of food", margin: 30} }
              ]
      f.chart({defaultSeriesType: "column"})
    end
  end
end
