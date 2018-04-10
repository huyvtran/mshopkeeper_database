//
//  BusinessSituationViewController.swift
//  MShopkeeper_Quanly
//
//  Created by ddthanh on 4/9/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import SwiftCharts

class BusinessSituationViewController: UIViewController {

    @IBOutlet weak var viewScroll: UIView!
    var chartView: Chart!
    var chartLine: LineChart!
    @IBOutlet weak var viewChartRevenue: UIView!
    @IBOutlet var viewChartTrend: UIView!
    @IBOutlet var vChartRevenue: UIView!
    @IBOutlet var vChartTrends: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //ConfigChart()
    }

    override func viewDidAppear(_ animated: Bool) {
        ConfigChart()
        drawChartTrend()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func ConfigChart() {
        let chartViewModel = ChartViewModel.init()
        let chart: Chart = chartViewModel.barsChart(frame: self.vChartRevenue.bounds)
        
        self.viewChartRevenue.addSubview(chart.view)
        self.chartView = chart
        
    }
    
    fileprivate func drawChartTrend() {
//        let chartConfig
        let chartConfig = ChartConfigXY.init(xAxisConfig: ChartAxisConfig.init(from: 0, to: 12, by: 2),
                                             yAxisConfig: ChartAxisConfig.init(from: 0, to: 10, by: 2))
        let chart = LineChart.init(frame: self.vChartTrends.frame,
                                   chartConfig: chartConfig,
                                   xTitle: "",
                                   yTitle: "",
                                   line: (chartPoints: [(1, 10), (5, 5), (7, 1), (8, 4)], color: UIColor.red))
        self.viewChartTrend.addSubview(chart.view)
        self.chartLine = chart
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func onClickMenu(_ sender: Any) {
        openLeft()
    }
    
}
