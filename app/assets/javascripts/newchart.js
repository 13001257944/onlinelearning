
  function setChart(Type,GetInx, Value){
    var config = liquidFillGaugeDefaultSettings();

        switch (Type) {
          case 2:
            config.circleColor = "#FF7777";
            config.textColor = "#FF4444";
            config.waveTextColor = "#FFAAAA";
            config.waveColor = "#FFDDDD";
            config.circleThickness = 0.2;
            // config.textVertPosition = 0.2;
            config.waveAnimateTime = 1000;
            break;
          case 3:
            config.circleColor = "#D4AB6A";
            config.textColor = "#553300";
            config.waveTextColor = "#805615";
            config.waveColor = "#AA7D39";
            config.circleThickness = 0.1;
            config.circleFillGap = 0.2;
            // config.textVertPosition = 0.8;
            config.waveAnimateTime = 2000;
            config.waveHeight = 0.3;
            config.waveCount = 1;
            break;
          default:
            break;
      }
    var idName = 'fillgaugeType' + Type + '_' + GetInx
    var gaugeType_GetInx = loadLiquidFillGauge(idName, Value, config);
  }

  // var gauge2= loadLiquidFillGauge("fillgauge2", 0, config1);
  // var gauge3 = loadLiquidFillGauge("fillgauge3", 0, config2);


