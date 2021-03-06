package powerapi.plugin.aop;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import powerapi.common.Constants;
import powerapi.common.anno.LogModify;
import powerapi.entity.BaseEntity;
import powerapi.entity.Log;
import powerapi.entity.User;
import powerapi.service.LogService;

import java.lang.reflect.Method;

/**
 * Created by Melon on 17/3/18.
 */
@Aspect
@Component
public class LogModifyAdvice {

    public static final Logger logger = Logger.getLogger(LogModifyAdvice.class);

    @Autowired
    private LogService logService;

    public BaseEntity aspectEntity;

    public static String ACTION;

    @Pointcut("@annotation(powerapi.common.anno.LogModify)")
    public void logAnnoAspect() {

    }

    /**
     * @param joinPoint
     */
    @AfterReturning("logAnnoAspect()")

    public void afterReturn(JoinPoint joinPoint) {
        MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
        Method method = methodSignature.getMethod();
        LogModify logModifyAnno = method.getAnnotation(LogModify.class);
        if (null != logModifyAnno) {

            BaseEntity entity = (BaseEntity) joinPoint.getArgs()[0];
            Log log = new Log();
            log.setUserId(((User) SecurityUtils.getSubject().getSession().getAttribute("curUser")).getId());
            log.setAction(ACTION + logModifyAnno.resource());
            log.setResource(entity.getLogResource());
            log.setResourceId(entity.getId());
            logService.insert(log);
        }
    }

    @Before("logAnnoAspect()")
    public void before(JoinPoint joinPoint) {
        MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
        Method method = methodSignature.getMethod();
        LogModify log = method.getAnnotation(LogModify.class);
        if (null != log) {
            aspectEntity = (BaseEntity) joinPoint.getArgs()[0];
            if (null == aspectEntity.getId()) {
                ACTION = Constants.LOG_ACTION_CREATE;
            } else {
                ACTION = Constants.LOG_ACTION_MODIFY;
            }
        }
    }
}
