package com.youhualife.datasource.annotation;

import java.lang.annotation.*;

/**
 * 多数据源注解
 *
 * @author hunji
 */
@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Inherited
public @interface DataSource {
    String value() default "";
}
