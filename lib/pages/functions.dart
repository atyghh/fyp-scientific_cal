class convertFunctions {
  String unitConvertor(String type, double input, String unit1, String unit2) {
    const Map<String, Map<String, double>> lengthConverter = {
      "mm": {"cm": 0.1, "m": 0.001, "km": 0.000001},
      "cm": {"mm": 10, "m": 0.01, "km": 0.00001},
      "m": {
        "mm": 1000,
        "cm": 100,
        "km": 0.001,
      },
      "km": {
        "mm": 1000000,
        "cm": 100000,
        "m": 1000,
      }
    };
    const Map<String, Map<String, double>> areaConverter = {
      "mm²": {"cm²": 0.01, "m²": 0.000001, "km²": 0.000000000001},
      "cm²": {"mm²": 100, "m²": 1e-4, "km²": 1e-10},
      "m²": {
        "mm²": 1e+6,
        "cm²": 10000,
        "km²": 1e-6,
      },
      "km²": {
        "mm²": 1e+10,
        "cm²": 1e+12,
        "m²": 1e+6,
      }
    };
    const Map<String, Map<String, double>> volumeConverter = {
      "mm³": {"cm³": 0.001, "m³": 1e-9, "km³": 1e-18},
      "cm³": {"mm³": 1000, "m³": 1e-6, "km³": 1e-15},
      "m³": {
        "mm³": 1e+9,
        "cm³": 1000000,
        "km³": 1e-9,
      },
      "km³": {
        "mm³": 1e+18,
        "cm³": 1e+15,
        "m³": 1e+9,
      }
    };
    const Map<String, Map<String, double>> timeConverter = {
      "seconds": {"minutes": 1 / 60, "hours": 1 / 3600, "days": 1 / 86400},
      "minutes": {"seconds": 60, "hours": 1 / 60, "days": 1 / 1440},
      "hours": {
        "seconds": 3600,
        "minutes": 60,
        "days": 1 / 24,
      },
      "days": {
        "seconds": 86400,
        "minutes": 1440,
        "hours": 24,
      }
    };
    const Map<String, Map<String, double>> speedConverter = {
      "mm/s": {
        "m/s": 0.001,
        "cm/s": 0.1,
        "km/s": 1e-6,
        "mm/min": 60,
        "m/min": 0.06,
        "cm/min": 6,
        "km/min": 6e-5,
        "mm/h": 3600,
        "m/h": 3.6,
        "cm/h": 360,
        "km/h": 0.0036
      },
      "m/s": {
        "mm/s": 1000,
        "cm/s": 100,
        "km/s": 0.001,
        "mm/min": 60000,
        "m/min": 60,
        "cm/min": 6000,
        "km/min": 0.06,
        "mm/h": 3.6e+6,
        "m/h": 3600,
        "cm/h": 360000,
        "km/h": 3.6
      },
      "cm/s": {
        "mm/s": 10,
        "m/s": 0.01,
        "km/s": 1e-5,
        "mm/min": 600,
        "m/min": 0.6,
        "cm/min": 60,
        "km/min": 6e-4,
        "mm/h": 36000,
        "m/h": 36,
        "cm/h": 3600,
        "km/h": 0.036
      },
      "km/s": {
        "mm/s": 1000000,
        "m/s": 1000,
        "cm/s": 100000,
        "mm/min": 6e+7,
        "m/min": 6e+4,
        "cm/min": 6e+6,
        "km/min": 60,
        "mm/h": 3.6e+9,
        "m/h": 3.6e+6,
        "cm/h": 3.6e+8,
        "km/h": 3600
      },
      "mm/min": {
        "mm/s": 0.0166667,
        "m/s": 1.66667e-5,
        "cm/s": 0.00166667,
        "km/s": 1.66667e-8,
        "m/min": 0.001,
        "cm/min": 0.1,
        "km/min": 1e-6,
        "mm/h": 60,
        "m/h": 0.06,
        "cm/h": 6,
        "km/h": 0.00006
      },
      "m/min": {
        "mm/s": 16.6667,
        "m/s": 0.0166667,
        "cm/s": 1.66667,
        "km/s": 1.66667e-5,
        "mm/min": 1000,
        "cm/min": 100,
        "km/min": 0.001,
        "mm/h": 60000,
        "m/h": 60,
        "cm/h": 6000,
        "km/h": 0.06
      },
      "cm/min": {
        "mm/s": 0.166667,
        "m/s": 0.000166667,
        "cm/s": 0.0166667,
        "km/s": 1.66667e-7,
        "mm/min": 10,
        "m/min": 0.01,
        "km/min": 1e-5,
        "mm/h": 600,
        "m/h": 0.6,
        "cm/h": 60,
        "km/h": 0.0006
      },
      "km/min": {
        "mm/s": 16666.7,
        "m/s": 16.6667,
        "cm/s": 1666.67,
        "km/s": 0.0166667,
        "mm/min": 1e+6,
        "m/min": 1000,
        "cm/min": 100000,
        "mm/h": 6e+7,
        "m/h": 6e+4,
        "cm/h": 6e+6,
        "km/h": 60
      },
      "mm/h": {
        "mm/s": 0.000277778,
        "m/s": 2.77778e-7,
        "cm/s": 2.77778e-5,
        "km/s": 2.77778e-10,
        "mm/min": 0.0166667,
        "m/min": 1.66667e-5,
        "cm/min": 0.00166667,
        "km/min": 1.66667e-8,
        "m/h": 0.000999999,
        "cm/h": 0.1,
        "km/h": 1e-6
      },
      "m/h": {
        "mm/s": 0.277778,
        "m/s": 0.000277778,
        "cm/s": 0.0277778,
        "km/s": 2.77778e-7,
        "mm/min": 16.6667,
        "m/min": 0.0166667,
        "cm/min": 1.66667,
        "km/min": 1.66667e-5,
        "mm/h": 1000,
        "cm/h": 100,
        "km/h": 0.001
      },
      "cm/h": {
        "mm/s": 0.00277778,
        "m/s": 2.77778e-6,
        "cm/s": 0.000277778,
        "km/s": 2.77778e-9,
        "mm/min": 0.166667,
        "m/min": 0.000166667,
        "km/min": 1.66667e-7,
        "mm/h": 10,
        "m/h": 0.01,
        "km/h": 1e-5
      },
      "km/h": {
        "mm/s": 277.778,
        "m/s": 0.277778,
        "cm/s": 27.7778,
        "km/s": 0.000277778,
        "mm/min": 16666.7,
        "m/min": 16.6667,
        "cm/min": 1666.67,
        "km/min": 0.0166667,
        "mm/h": 1e+6,
        "m/h": 1000,
        "cm/h": 100000
      }
    };
    const Map<String, Map<String, double>> accelerationConverter = {
      "m/s²": {"km/s²": 0.001, "cm/s²": 100, "mm/s²": 1000},
      "km/s²": {"m/s²": 1000, "cm/s²": 100000, "mm/s²": 1000000},
      "cm/s²": {
        "m/s²": 0.01,
        "km/s²": 1e-5,
        "mm/s²": 10,
      },
      "mm/s²": {
        "m/s²": 0.001,
        "km/s²": 1e-6,
        "cm/s²": 0.1,
      }
    };
    // const Map<String, Map> typeDict = {
    //   "length": lengthConverter,
    //   "area": areaConverter,
    //   "volume": volumeConverter,
    //   "time": timeConverter,
    //   "speed": speedConverter,
    //   "acc": accelerationConverter
    // };
    switch (type) {
      case "length":
        input = input * lengthConverter[unit1]![unit2]!;
        break;
      case "area":
        input = input * areaConverter[unit1]![unit2]!;
        break;
      case "volume":
        input = input * volumeConverter[unit1]![unit2]!;
        break;
      case "time":
        input = input * timeConverter[unit1]![unit2]!;
        break;
      case "speed":
        input = input * speedConverter[unit1]![unit2]!;
        break;
      case "acc":
        input = input * accelerationConverter[unit1]![unit2]!;
        break;
      default:
        break;
    }

    return input.toString();
  }
}
