class Waveguide {
  Map<String, dynamic> cell;
  Map<String, dynamic> geometry;
  Map<String, dynamic> sources;
  Map<String, dynamic> simulationTime;
  double pmlLayers;
  int resolution;

  void setCell(Map<String, dynamic> cell) {
    this.cell = cell;
  }

  void setGeometry(Map<String, dynamic> geometry) {
    this.geometry = geometry;
  }

  void setSources(Map<String, dynamic> sources) {
    this.sources = sources;
  }

  void setSimulationTime(Map<String, dynamic> simulationTime) {
    this.simulationTime = simulationTime;
  }

  void setPmlLayers(double pmlLayers) {
    this.pmlLayers = pmlLayers;
  }

  void setResolution(int resolution) {
    this.resolution = resolution;
  }
}
