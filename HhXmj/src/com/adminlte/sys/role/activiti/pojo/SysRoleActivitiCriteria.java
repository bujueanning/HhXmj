package com.adminlte.sys.role.activiti.pojo;

import java.util.ArrayList;
import java.util.List;

public class SysRoleActivitiCriteria {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public SysRoleActivitiCriteria() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andSysRoleActivitiIdIsNull() {
            addCriterion("sys_role_activiti_id is null");
            return (Criteria) this;
        }

        public Criteria andSysRoleActivitiIdIsNotNull() {
            addCriterion("sys_role_activiti_id is not null");
            return (Criteria) this;
        }

        public Criteria andSysRoleActivitiIdEqualTo(String value) {
            addCriterion("sys_role_activiti_id =", value, "sysRoleActivitiId");
            return (Criteria) this;
        }

        public Criteria andSysRoleActivitiIdNotEqualTo(String value) {
            addCriterion("sys_role_activiti_id <>", value, "sysRoleActivitiId");
            return (Criteria) this;
        }

        public Criteria andSysRoleActivitiIdGreaterThan(String value) {
            addCriterion("sys_role_activiti_id >", value, "sysRoleActivitiId");
            return (Criteria) this;
        }

        public Criteria andSysRoleActivitiIdGreaterThanOrEqualTo(String value) {
            addCriterion("sys_role_activiti_id >=", value, "sysRoleActivitiId");
            return (Criteria) this;
        }

        public Criteria andSysRoleActivitiIdLessThan(String value) {
            addCriterion("sys_role_activiti_id <", value, "sysRoleActivitiId");
            return (Criteria) this;
        }

        public Criteria andSysRoleActivitiIdLessThanOrEqualTo(String value) {
            addCriterion("sys_role_activiti_id <=", value, "sysRoleActivitiId");
            return (Criteria) this;
        }

        public Criteria andSysRoleActivitiIdLike(String value) {
            addCriterion("sys_role_activiti_id like", value, "sysRoleActivitiId");
            return (Criteria) this;
        }

        public Criteria andSysRoleActivitiIdNotLike(String value) {
            addCriterion("sys_role_activiti_id not like", value, "sysRoleActivitiId");
            return (Criteria) this;
        }

        public Criteria andSysRoleActivitiIdIn(List<String> values) {
            addCriterion("sys_role_activiti_id in", values, "sysRoleActivitiId");
            return (Criteria) this;
        }

        public Criteria andSysRoleActivitiIdNotIn(List<String> values) {
            addCriterion("sys_role_activiti_id not in", values, "sysRoleActivitiId");
            return (Criteria) this;
        }

        public Criteria andSysRoleActivitiIdBetween(String value1, String value2) {
            addCriterion("sys_role_activiti_id between", value1, value2, "sysRoleActivitiId");
            return (Criteria) this;
        }

        public Criteria andSysRoleActivitiIdNotBetween(String value1, String value2) {
            addCriterion("sys_role_activiti_id not between", value1, value2, "sysRoleActivitiId");
            return (Criteria) this;
        }

        public Criteria andSysRoleIdIsNull() {
            addCriterion("sys_role_id is null");
            return (Criteria) this;
        }

        public Criteria andSysRoleIdIsNotNull() {
            addCriterion("sys_role_id is not null");
            return (Criteria) this;
        }

        public Criteria andSysRoleIdEqualTo(String value) {
            addCriterion("sys_role_id =", value, "sysRoleId");
            return (Criteria) this;
        }

        public Criteria andSysRoleIdNotEqualTo(String value) {
            addCriterion("sys_role_id <>", value, "sysRoleId");
            return (Criteria) this;
        }

        public Criteria andSysRoleIdGreaterThan(String value) {
            addCriterion("sys_role_id >", value, "sysRoleId");
            return (Criteria) this;
        }

        public Criteria andSysRoleIdGreaterThanOrEqualTo(String value) {
            addCriterion("sys_role_id >=", value, "sysRoleId");
            return (Criteria) this;
        }

        public Criteria andSysRoleIdLessThan(String value) {
            addCriterion("sys_role_id <", value, "sysRoleId");
            return (Criteria) this;
        }

        public Criteria andSysRoleIdLessThanOrEqualTo(String value) {
            addCriterion("sys_role_id <=", value, "sysRoleId");
            return (Criteria) this;
        }

        public Criteria andSysRoleIdLike(String value) {
            addCriterion("sys_role_id like", value, "sysRoleId");
            return (Criteria) this;
        }

        public Criteria andSysRoleIdNotLike(String value) {
            addCriterion("sys_role_id not like", value, "sysRoleId");
            return (Criteria) this;
        }

        public Criteria andSysRoleIdIn(List<String> values) {
            addCriterion("sys_role_id in", values, "sysRoleId");
            return (Criteria) this;
        }

        public Criteria andSysRoleIdNotIn(List<String> values) {
            addCriterion("sys_role_id not in", values, "sysRoleId");
            return (Criteria) this;
        }

        public Criteria andSysRoleIdBetween(String value1, String value2) {
            addCriterion("sys_role_id between", value1, value2, "sysRoleId");
            return (Criteria) this;
        }

        public Criteria andSysRoleIdNotBetween(String value1, String value2) {
            addCriterion("sys_role_id not between", value1, value2, "sysRoleId");
            return (Criteria) this;
        }

        public Criteria andSysActivitiIdIsNull() {
            addCriterion("sys_activiti_id is null");
            return (Criteria) this;
        }

        public Criteria andSysActivitiIdIsNotNull() {
            addCriterion("sys_activiti_id is not null");
            return (Criteria) this;
        }

        public Criteria andSysActivitiIdEqualTo(String value) {
            addCriterion("sys_activiti_id =", value, "sysActivitiId");
            return (Criteria) this;
        }

        public Criteria andSysActivitiIdNotEqualTo(String value) {
            addCriterion("sys_activiti_id <>", value, "sysActivitiId");
            return (Criteria) this;
        }

        public Criteria andSysActivitiIdGreaterThan(String value) {
            addCriterion("sys_activiti_id >", value, "sysActivitiId");
            return (Criteria) this;
        }

        public Criteria andSysActivitiIdGreaterThanOrEqualTo(String value) {
            addCriterion("sys_activiti_id >=", value, "sysActivitiId");
            return (Criteria) this;
        }

        public Criteria andSysActivitiIdLessThan(String value) {
            addCriterion("sys_activiti_id <", value, "sysActivitiId");
            return (Criteria) this;
        }

        public Criteria andSysActivitiIdLessThanOrEqualTo(String value) {
            addCriterion("sys_activiti_id <=", value, "sysActivitiId");
            return (Criteria) this;
        }

        public Criteria andSysActivitiIdLike(String value) {
            addCriterion("sys_activiti_id like", value, "sysActivitiId");
            return (Criteria) this;
        }

        public Criteria andSysActivitiIdNotLike(String value) {
            addCriterion("sys_activiti_id not like", value, "sysActivitiId");
            return (Criteria) this;
        }

        public Criteria andSysActivitiIdIn(List<String> values) {
            addCriterion("sys_activiti_id in", values, "sysActivitiId");
            return (Criteria) this;
        }

        public Criteria andSysActivitiIdNotIn(List<String> values) {
            addCriterion("sys_activiti_id not in", values, "sysActivitiId");
            return (Criteria) this;
        }

        public Criteria andSysActivitiIdBetween(String value1, String value2) {
            addCriterion("sys_activiti_id between", value1, value2, "sysActivitiId");
            return (Criteria) this;
        }

        public Criteria andSysActivitiIdNotBetween(String value1, String value2) {
            addCriterion("sys_activiti_id not between", value1, value2, "sysActivitiId");
            return (Criteria) this;
        }

        public Criteria andSysRoleActivitiTypeIsNull() {
            addCriterion("sys_role_activiti_type is null");
            return (Criteria) this;
        }

        public Criteria andSysRoleActivitiTypeIsNotNull() {
            addCriterion("sys_role_activiti_type is not null");
            return (Criteria) this;
        }

        public Criteria andSysRoleActivitiTypeEqualTo(String value) {
            addCriterion("sys_role_activiti_type =", value, "sysRoleActivitiType");
            return (Criteria) this;
        }

        public Criteria andSysRoleActivitiTypeNotEqualTo(String value) {
            addCriterion("sys_role_activiti_type <>", value, "sysRoleActivitiType");
            return (Criteria) this;
        }

        public Criteria andSysRoleActivitiTypeGreaterThan(String value) {
            addCriterion("sys_role_activiti_type >", value, "sysRoleActivitiType");
            return (Criteria) this;
        }

        public Criteria andSysRoleActivitiTypeGreaterThanOrEqualTo(String value) {
            addCriterion("sys_role_activiti_type >=", value, "sysRoleActivitiType");
            return (Criteria) this;
        }

        public Criteria andSysRoleActivitiTypeLessThan(String value) {
            addCriterion("sys_role_activiti_type <", value, "sysRoleActivitiType");
            return (Criteria) this;
        }

        public Criteria andSysRoleActivitiTypeLessThanOrEqualTo(String value) {
            addCriterion("sys_role_activiti_type <=", value, "sysRoleActivitiType");
            return (Criteria) this;
        }

        public Criteria andSysRoleActivitiTypeLike(String value) {
            addCriterion("sys_role_activiti_type like", value, "sysRoleActivitiType");
            return (Criteria) this;
        }

        public Criteria andSysRoleActivitiTypeNotLike(String value) {
            addCriterion("sys_role_activiti_type not like", value, "sysRoleActivitiType");
            return (Criteria) this;
        }

        public Criteria andSysRoleActivitiTypeIn(List<String> values) {
            addCriterion("sys_role_activiti_type in", values, "sysRoleActivitiType");
            return (Criteria) this;
        }

        public Criteria andSysRoleActivitiTypeNotIn(List<String> values) {
            addCriterion("sys_role_activiti_type not in", values, "sysRoleActivitiType");
            return (Criteria) this;
        }

        public Criteria andSysRoleActivitiTypeBetween(String value1, String value2) {
            addCriterion("sys_role_activiti_type between", value1, value2, "sysRoleActivitiType");
            return (Criteria) this;
        }

        public Criteria andSysRoleActivitiTypeNotBetween(String value1, String value2) {
            addCriterion("sys_role_activiti_type not between", value1, value2, "sysRoleActivitiType");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}