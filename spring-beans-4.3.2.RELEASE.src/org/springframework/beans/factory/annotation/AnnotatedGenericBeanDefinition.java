/*     */ package org.springframework.beans.factory.annotation;
/*     */ 
/*     */ import org.springframework.beans.factory.support.GenericBeanDefinition;
/*     */ import org.springframework.core.type.AnnotationMetadata;
/*     */ import org.springframework.core.type.MethodMetadata;
/*     */ import org.springframework.core.type.StandardAnnotationMetadata;
/*     */ import org.springframework.util.Assert;
/*     */ 
/*     */ public class AnnotatedGenericBeanDefinition extends GenericBeanDefinition
/*     */   implements AnnotatedBeanDefinition
/*     */ {
/*     */   private final AnnotationMetadata metadata;
/*     */   private MethodMetadata factoryMethodMetadata;
/*     */ 
/*     */   public AnnotatedGenericBeanDefinition(Class<?> beanClass)
/*     */   {
/*  55 */     setBeanClass(beanClass);
/*  56 */     this.metadata = new StandardAnnotationMetadata(beanClass, true);
/*     */   }
/*     */ 
/*     */   public AnnotatedGenericBeanDefinition(AnnotationMetadata metadata)
/*     */   {
/*  70 */     Assert.notNull(metadata, "AnnotationMetadata must not be null");
/*  71 */     if ((metadata instanceof StandardAnnotationMetadata)) {
/*  72 */       setBeanClass(((StandardAnnotationMetadata)metadata).getIntrospectedClass());
/*     */     }
/*     */     else {
/*  75 */       setBeanClassName(metadata.getClassName());
/*     */     }
/*  77 */     this.metadata = metadata;
/*     */   }
/*     */ 
/*     */   public AnnotatedGenericBeanDefinition(AnnotationMetadata metadata, MethodMetadata factoryMethodMetadata)
/*     */   {
/*  88 */     this(metadata);
/*  89 */     Assert.notNull(factoryMethodMetadata, "MethodMetadata must not be null");
/*  90 */     setFactoryMethodName(factoryMethodMetadata.getMethodName());
/*  91 */     this.factoryMethodMetadata = factoryMethodMetadata;
/*     */   }
/*     */ 
/*     */   public final AnnotationMetadata getMetadata()
/*     */   {
/*  97 */     return this.metadata;
/*     */   }
/*     */ 
/*     */   public final MethodMetadata getFactoryMethodMetadata()
/*     */   {
/* 102 */     return this.factoryMethodMetadata;
/*     */   }
/*     */ }

/* Location:           D:\repo\org\springframework\spring-beans\4.3.2.RELEASE\spring-beans-4.3.2.RELEASE.jar
 * Qualified Name:     org.springframework.beans.factory.annotation.AnnotatedGenericBeanDefinition
 * JD-Core Version:    0.6.2
 */