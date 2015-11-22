---
title       : Titanic disaster
subtitle    : Chance to survive onboard
author      : dddbbb
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
ext_widgets : {rCharts: [libraries/nvd3]}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---


## About Project

Application predicts chance to survive onboard Titanic by passanger data.

Used dataset from Kaggle's <a href="http://www.kaggle.com/c/titanic", target="_blank">"Titanic: Machine Learning from Disaster"</a> competition.

For predicting was taken 7 variables from dataset, and builted random forest model

Model has about 0.77 accuracy amd used only for demonstration purpouse

Model saved to a file and used in server.ui part of shiny application.

---

## Male Data by Pclass
For some explaratory analysis take a look at "Survived"" vs "Passanger class"" chart by Male subset

(Dark colors for "Died", Bright for "Survived")

<div id = 'chart1' class = 'rChart nvd3'></div>
<script type='text/javascript'>
 $(document).ready(function(){
      drawchart1()
    });
    function drawchart1(){  
      var opts = {
 "dom": "chart1",
"width":    800,
"height":    400,
"x": "Pclass",
"y": "freq",
"group": "Survived",
"type": "pieChart",
"id": "chart1" 
},
        data = [
 {
 "Pclass": "1",
"Survived": "Died",
"freq": 77 
},
{
 "Pclass": "1",
"Survived": "Survived",
"freq": 45 
},
{
 "Pclass": "2",
"Survived": "Died",
"freq": 91 
},
{
 "Pclass": "2",
"Survived": "Survived",
"freq": 17 
},
{
 "Pclass": "3",
"Survived": "Died",
"freq": 300 
},
{
 "Pclass": "3",
"Survived": "Survived",
"freq": 47 
} 
]
  
      if(!(opts.type==="pieChart" || opts.type==="sparklinePlus" || opts.type==="bulletChart")) {
        var data = d3.nest()
          .key(function(d){
            //return opts.group === undefined ? 'main' : d[opts.group]
            //instead of main would think a better default is opts.x
            return opts.group === undefined ? opts.y : d[opts.group];
          })
          .entries(data);
      }
      
      if (opts.disabled != undefined){
        data.map(function(d, i){
          d.disabled = opts.disabled[i]
        })
      }
      
      nv.addGraph(function() {
        var chart = nv.models[opts.type]()
          .width(opts.width)
          .height(opts.height)
          
        if (opts.type != "bulletChart"){
          chart
            .x(function(d) { return d[opts.x] })
            .y(function(d) { return d[opts.y] })
        }
          
         
        
          
        

        
        
        
      
       d3.select("#" + opts.id)
        .append('svg')
        .datum(data)
        .transition().duration(500)
        .call(chart);

       nv.utils.windowResize(chart.update);
       return chart;
      });
    };
</script>

---

## Female Data by Pclass
And for Female (Dark colors for "Died", Bright for "Survived")


<div id = 'chart2' class = 'rChart nvd3'></div>
<script type='text/javascript'>
 $(document).ready(function(){
      drawchart2()
    });
    function drawchart2(){  
      var opts = {
 "dom": "chart2",
"width":    800,
"height":    400,
"x": "Pclass",
"y": "freq",
"group": "Survived",
"type": "pieChart",
"id": "chart2" 
},
        data = [
 {
 "Pclass": "1",
"Survived": "Died",
"freq": 3 
},
{
 "Pclass": "1",
"Survived": "Survived",
"freq": 91 
},
{
 "Pclass": "2",
"Survived": "Died",
"freq": 6 
},
{
 "Pclass": "2",
"Survived": "Survived",
"freq": 70 
},
{
 "Pclass": "3",
"Survived": "Died",
"freq": 72 
},
{
 "Pclass": "3",
"Survived": "Survived",
"freq": 72 
} 
]
  
      if(!(opts.type==="pieChart" || opts.type==="sparklinePlus" || opts.type==="bulletChart")) {
        var data = d3.nest()
          .key(function(d){
            //return opts.group === undefined ? 'main' : d[opts.group]
            //instead of main would think a better default is opts.x
            return opts.group === undefined ? opts.y : d[opts.group];
          })
          .entries(data);
      }
      
      if (opts.disabled != undefined){
        data.map(function(d, i){
          d.disabled = opts.disabled[i]
        })
      }
      
      nv.addGraph(function() {
        var chart = nv.models[opts.type]()
          .width(opts.width)
          .height(opts.height)
          
        if (opts.type != "bulletChart"){
          chart
            .x(function(d) { return d[opts.x] })
            .y(function(d) { return d[opts.y] })
        }
          
         
        
          
        

        
        
        
      
       d3.select("#" + opts.id)
        .append('svg')
        .datum(data)
        .transition().duration(500)
        .call(chart);

       nv.utils.windowResize(chart.update);
       return chart;
      });
    };
</script>

---

## Interface of app

<img src="./assets/img/ui.png" height = "550" width = "900">

---

## The End

Link to app <a href = "https://dddbbb.shinyapps.io/Titanic" target="_blank">Link to app</a>

Thank you!
