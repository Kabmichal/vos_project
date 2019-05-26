module AnimalsHelper
  def animal_food_chart
    @animal_food_chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "Animal food calories graph")
      f.xAxis(name: "Time", categories: @AllCaloriesSql.map{|s| s["current_date"]})
      f.series(name: "Number of calories", yAxis: 0, data: @AllCaloriesSql.map{|s| s["csum"]})
      f.legend(align: 'right', verticalAlign: 'top', y: 175, x: -15, layout: 'vertical')
      f.yAxis [
                  {title: {text: "NUmber of calories", margin: 30} }
              ]
      f.chart({defaultSeriesType: "spline"})
    end
  end


  def globals(color)
    @chart_globals = LazyHighCharts::HighChartGlobals.new do |f|
      f.chart(
          backgroundColor: {
              linearGradient: [10, 0, 0, 100],
              stops: [
                  [0, "rgb(255, 255, 255)"],
                  [1, "rgb(240, 240, 255)"]
              ]
          },
          borderWidth: 2,
          plotBackgroundColor: "rgba(255, 255, 255, .9)",
          plotShadow: true,
          plotBorderWidth: 1
      )
      f.lang(thousandsSep: ",")
      f.colors([color, "#f7a35c", "#8085e9", "#f15c80", "#e4d354"])
    end
    end
end
