/*     */ package org.springframework.beans.factory.config;
/*     */ 
/*     */ import java.io.Serializable;
/*     */ import org.springframework.beans.BeansException;
/*     */ import org.springframework.beans.factory.BeanFactory;
/*     */ import org.springframework.beans.factory.ObjectFactory;
/*     */ import org.springframework.util.Assert;
/*     */ 
/*     */ public class ObjectFactoryCreatingFactoryBean extends AbstractFactoryBean<ObjectFactory<Object>>
/*     */ {
/*     */   private String targetBeanName;
/*     */ 
/*     */   public void setTargetBeanName(String targetBeanName)
/*     */   {
/* 110 */     this.targetBeanName = targetBeanName;
/*     */   }
/*     */ 
/*     */   public void afterPropertiesSet() throws Exception
/*     */   {
/* 115 */     Assert.hasText(this.targetBeanName, "Property 'targetBeanName' is required");
/* 116 */     super.afterPropertiesSet();
/*     */   }
/*     */ 
/*     */   public Class<?> getObjectType()
/*     */   {
/* 122 */     return ObjectFactory.class;
/*     */   }
/*     */ 
/*     */   protected ObjectFactory<Object> createInstance()
/*     */   {
/* 127 */     return new TargetBeanObjectFactory(getBeanFactory(), this.targetBeanName);
/*     */   }
/*     */ 
/*     */   private static class TargetBeanObjectFactory
/*     */     implements ObjectFactory<Object>, Serializable
/*     */   {
/*     */     private final BeanFactory beanFactory;
/*     */     private final String targetBeanName;
/*     */ 
/*     */     public TargetBeanObjectFactory(BeanFactory beanFactory, String targetBeanName)
/*     */     {
/* 142 */       this.beanFactory = beanFactory;
/* 143 */       this.targetBeanName = targetBeanName;
/*     */     }
/*     */ 
/*     */     public Object getObject() throws BeansException
/*     */     {
/* 148 */       return this.beanFactory.getBean(this.targetBeanName);
/*     */     }
/*     */   }
/*     */ }

/* Location:           D:\repo\org\springframework\spring-beans\4.3.2.RELEASE\spring-beans-4.3.2.RELEASE.jar
 * Qualified Name:     org.springframework.beans.factory.config.ObjectFactoryCreatingFactoryBean
 * JD-Core Version:    0.6.2
 */