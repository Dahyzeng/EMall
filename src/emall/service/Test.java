package emall.service;

import emall.service.merchant.statistic.StatisticServer;

/**
 * Created by taurin on 2016/5/21.
 */
public class Test {
    public static void main(String args[]) {
        StatisticServer statisticServer = new StatisticServer();
        statisticServer.getStatisticByWeek();
    }
}
