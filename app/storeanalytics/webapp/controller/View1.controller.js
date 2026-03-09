sap.ui.define([
    "sap/ui/core/mvc/Controller",
], (Controller) => {
    "use strict";

    return Controller.extend("com.demo.storeanalytics.controller.View1", {
        onInit() {
            var oVizFrame = this.oVizFrame = this.getView().byId("storeWiseSales");
            oVizFrame.setVizProperties({
                plotArea: {
                    dataLabel: {
                        visible: true,
                    }
                },
                title: {
                    visible: true,
                    text: "Store Wise Sales"
                }
            });
            var oVizFrame = this.oVizFrame = this.getView().byId("productWiseSales");
            oVizFrame.setVizProperties({
                plotArea: {
                    dataLabel: {
                        visible: true,
                    }
                },
                title: {
                    visible: true,
                    text: "Product Wise Sales"
                }
            });
            var oVizFrame = this.oVizFrame = this.getView().byId("LowstockAlert");
            oVizFrame.setVizProperties({
                plotArea: {
                    dataLabel: {
                        visible: true,
                    }
                },
                title: {
                    visible: true,
                    text: "Low stock Alert"
                }
            });
            var oVizFrame = this.oVizFrame = this.getView().byId("Top3Orders");
            oVizFrame.setVizProperties({
                plotArea: {
                    dataLabel: {
                        visible: true,
                    }
                },
                title: {
                    visible: true,
                    text: "Top 3 Orders"
                }
            });
        }
    });
});