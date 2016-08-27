/*    */ package org.springframework.beans.factory.annotation;
/*    */ 
/*    */ public enum Autowire
/*    */ {
/* 40 */   NO(0), 
/*    */ 
/* 45 */   BY_NAME(1), 
/*    */ 
/* 50 */   BY_TYPE(2);
/*    */ 
/*    */   private final int value;
/*    */ 
/*    */   private Autowire(int value)
/*    */   {
/* 57 */     this.value = value;
/*    */   }
/*    */ 
/*    */   public int value() {
/* 61 */     return this.value;
/*    */   }
/*    */ 
/*    */   public boolean isAutowire()
/*    */   {
/* 70 */     return (this == BY_NAME) || (this == BY_TYPE);
/*    */   }
/*    */ }

/* Location:           D:\repo\org\springframework\spring-beans\4.3.2.RELEASE\spring-beans-4.3.2.RELEASE.jar
 * Qualified Name:     org.springframework.beans.factory.annotation.Autowire
 * JD-Core Version:    0.6.2
 */