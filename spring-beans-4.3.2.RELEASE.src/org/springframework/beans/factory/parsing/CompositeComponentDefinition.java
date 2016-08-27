/*    */ package org.springframework.beans.factory.parsing;
/*    */ 
/*    */ import java.util.LinkedList;
/*    */ import java.util.List;
/*    */ import org.springframework.util.Assert;
/*    */ 
/*    */ public class CompositeComponentDefinition extends AbstractComponentDefinition
/*    */ {
/*    */   private final String name;
/*    */   private final Object source;
/* 39 */   private final List<ComponentDefinition> nestedComponents = new LinkedList();
/*    */ 
/*    */   public CompositeComponentDefinition(String name, Object source)
/*    */   {
/* 48 */     Assert.notNull(name, "Name must not be null");
/* 49 */     this.name = name;
/* 50 */     this.source = source;
/*    */   }
/*    */ 
/*    */   public String getName()
/*    */   {
/* 56 */     return this.name;
/*    */   }
/*    */ 
/*    */   public Object getSource()
/*    */   {
/* 61 */     return this.source;
/*    */   }
/*    */ 
/*    */   public void addNestedComponent(ComponentDefinition component)
/*    */   {
/* 70 */     Assert.notNull(component, "ComponentDefinition must not be null");
/* 71 */     this.nestedComponents.add(component);
/*    */   }
/*    */ 
/*    */   public ComponentDefinition[] getNestedComponents()
/*    */   {
/* 79 */     return (ComponentDefinition[])this.nestedComponents.toArray(new ComponentDefinition[this.nestedComponents.size()]);
/*    */   }
/*    */ }

/* Location:           D:\repo\org\springframework\spring-beans\4.3.2.RELEASE\spring-beans-4.3.2.RELEASE.jar
 * Qualified Name:     org.springframework.beans.factory.parsing.CompositeComponentDefinition
 * JD-Core Version:    0.6.2
 */