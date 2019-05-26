module StatisticsHelper
  def animal_calories
    @all_animal_food_chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "Animal food2  graph")
      f.xAxis(name: "Time", categories: @animal_calories.map{|s| s["type"]})
      f.series(name: "Number of all users ", yAxis: 0, data: @animal_calories.map{|s| s["cround"].to_i})
      f.series(name: "My animals", yAxis: 0, data:@my_animal_calories.map{|s| s["output"].to_i})
      f.legend(align: 'right', verticalAlign: 'top', y: 175, x: -15, layout: 'vertical')
      f.yAxis [
                  {title: {text: "NUmber of calories", margin: 30} }
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
      f.title(text: "Animal  calories graph")
      f.xAxis(name: "Time", categories: @my_animal_calories.map{|s| s["type"]})
      f.series(name: "Number of calories", yAxis: 0, data:@my_animal_calories.map{|s| s["output"].to_i})
      f.legend(align: 'right', verticalAlign: 'top', y: 175, x: -15, layout: 'vertical')
      f.yAxis [
                  {title: {text: "NUmber of calories", margin: 30} }
              ]
      f.chart({defaultSeriesType: "column"})
    end
  end
end
