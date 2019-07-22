package org.iii.seaotter.jayee.schedule;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.concurrent.TimeUnit;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;


//想看怎麼運作可以把方法內註解取消
@Component
public class ScheduledTasks {
	private static final Logger logger =LoggerFactory.getLogger(ScheduledTasks.class);
	private static final DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");
	
	
	//每20000ms(20秒)執行一次，不論前次任務是否拖延
	@Scheduled(fixedRate=20000)
	public void scheduleTaskWithFixedRate() {
//		logger.info("FixedRateTask--Execution Time--{}",dateTimeFormatter.format(LocalDateTime.now()));
//		logger.info("Current Thread--{}", Thread.currentThread().getName());
	};
	
	//每20000ms(20秒)執行一次，若前次任務拖延，則跟著延後執行
	@Scheduled(fixedDelay=20000)
	public void scheduleTaskWithFixedDelay() {
//		logger.info("FixedDelayTask--Execution Time--{}",dateTimeFormatter.format(LocalDateTime.now()));
//		logger.info("Current Thread--{}", Thread.currentThread().getName());
//			try {
//				//先睡50秒才完成此次任務，所以兩次任務間會間隔70秒
//				TimeUnit.SECONDS.sleep(50);
//			} catch (InterruptedException ex) {
//				logger.error("Ran into an error {}", ex);
//				ex.printStackTrace();
//			}
	};
	
	//先Delay5秒再開始任務，每2秒執行一次
	@Scheduled(fixedRate=20000, initialDelay=5000)
	public void scheduleTaskWithFixedInitialDelay() {
//		logger.info("FixedInitialDelayTask--Execution Time--{}",dateTimeFormatter.format(LocalDateTime.now()));
//		logger.info("Current Thread--{}", Thread.currentThread().getName());
	};
	
	//cron expression(6~7項，用空格分開　左到右依次是：秒 分 時 日 月 周幾 年)
	//年通常會省略　*=所有值；?=無所謂(通常放在周幾)；,=或者；/=增量值；-=區間
	//可以搜尋「CronMaker」 可以依需求自動產生Cron expression
	@Scheduled(cron = "0/1 * * * * ?")//每隔1秒執行一次
	public void scheduleTaskWithCronExpression() {
//		logger.info("CronTask--Execution Time--{}",dateTimeFormatter.format(LocalDateTime.now()));
//		logger.info("Current Thread--{}", Thread.currentThread().getName());	
	};
	
	
}
