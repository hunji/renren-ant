package com.youhualife.modules.app.annotation;

import java.lang.annotation.*;

/**
 * app登录效验
 *
 * @author hunji
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Login {
}
