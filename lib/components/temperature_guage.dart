import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class TemperatureGauge extends StatelessWidget {
  TemperatureGauge({required this.minTemperature,required this.maxTemperature,required this.currentTemperature});
  double? minTemperature ;
  double? maxTemperature;
  double? currentTemperature;

  // double minTemperature = -20;
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      // width: 400,
      height: 180,
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
            minimum: minTemperature??0,
            maximum: maxTemperature??10,
            canScaleToFit: true,
            showLabels: true,
            showTicks: false,
            startAngle: 180,
            endAngle: 0,
            axisLabelStyle: GaugeTextStyle(fontWeight: FontWeight.bold,fontSize: 16),
            axisLineStyle: AxisLineStyle(
              thickness: 10,
              color: Colors.red,
            ),
            pointers: <GaugePointer>[
              MarkerPointer(
                value: currentTemperature??0,
                enableDragging: true,
                color: Colors.black,
                markerType: MarkerType.diamond,
                markerHeight: 20,
                markerWidth: 20,
              ),
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                widget: Container(
                  child: Text(
                    '${currentTemperature?.toStringAsFixed(1)}°C',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color: Colors.white70),
                  ),
                ),
                positionFactor: 0,
                angle: 90,
              ),
            ],
            ranges: <GaugeRange>[
              GaugeRange(
                startValue: minTemperature??0,
                endValue: maxTemperature??10,
                color: Colors.white70,
                startWidth: 10,
                endWidth: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}