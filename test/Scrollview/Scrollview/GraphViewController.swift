

import Cocoa
import Charts
class GraphViewController: NSViewController {
    

 
    @IBOutlet weak var Graphview: LineChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let myObject: NSObject = ReadFile()
        if let myVc = myObject as? ReadFile {
            
            let yaxis =  myVc.readTemperatureFiles ()
            
            print(yaxis)
         
         let ydataset = yaxis.enumerate().map { x, y in return ChartDataEntry(x: Double(x), y: (y as! NSString).doubleValue) }
            
   
            
//            let xdataset = xaxis.enumerate().map { x, y in return ChartDataEntry(x: Double(x), y: (y as NSString).doubleValue) }
            
            
            
            let data = LineChartData()
          //  let ds1 = LineChartDataSet(values: ydataset, label: "Temp")
            
//            let ds2 = LineChartDataSet(values: xdataset, label: "Time")
          
          //  ds1.colors = [NSUIColor.redColor()]
           // data.addDataSet(ds1)
//            data.addDataSet(ds2)
           // self.Graphview.rightAxis.drawLabelsEnabled = false
        
           // ds1.circleRadius = 0.0
         //   self.Graphview.xAxis.labelPosition = .Bottom
        
            self.Graphview.data = data
            
            self.Graphview.gridBackgroundColor = NSUIColor.whiteColor()
            
            self.Graphview.descriptionText = "Temp chart"
            
        }
    }
    
    
  
    
}
