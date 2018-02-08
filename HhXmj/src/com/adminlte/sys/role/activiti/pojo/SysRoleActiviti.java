package com.adminlte.sys.role.activiti.pojo;

import java.io.Serializable;

public class SysRoleActiviti implements Serializable {
    /** 主键 */
    private String sysRoleActivitiId;

    /** 角色主键 */
    private String sysRoleId;

    /** 流程id */
    private String sysActivitiId;

    /** partsel有子节点被选中selected选中的节点 */
    private String sysRoleActivitiType;

    private static final long serialVersionUID = 1L;

    /** 主键 */
    public String getSysRoleActivitiId() {
        return sysRoleActivitiId;
    }

    /** 主键 */
    public void setSysRoleActivitiId(String sysRoleActivitiId) {
        this.sysRoleActivitiId = sysRoleActivitiId;
    }

    /** 角色主键 */
    public String getSysRoleId() {
        return sysRoleId;
    }

    /** 角色主键 */
    public void setSysRoleId(String sysRoleId) {
        this.sysRoleId = sysRoleId;
    }

    /** 流程id */
    public String getSysActivitiId() {
        return sysActivitiId;
    }

    /** 流程id */
    public void setSysActivitiId(String sysActivitiId) {
        this.sysActivitiId = sysActivitiId;
    }

    /** partsel有子节点被选中selected选中的节点 */
    public String getSysRoleActivitiType() {
        return sysRoleActivitiType;
    }

    /** partsel有子节点被选中selected选中的节点 */
    public void setSysRoleActivitiType(String sysRoleActivitiType) {
        this.sysRoleActivitiType = sysRoleActivitiType;
    }
}