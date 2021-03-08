export default {
  route: {
    dashboard: '首页',
    system_management: '系统管理',
    permission_management: '权限管理',
    user_management: '用户管理',
    role_management: '角色管理',
    dept_management: '部门管理',
    menu_management: '菜单管理',
    system_monitor: '系统监控',
    introduction: '简述',
    documentation: '文档',
    guide: '引导页',
    pagePermission: '页面权限',
    directivePermission: '指令权限',
    icons: '图标',
    components: '组件',
    componentIndex: '介绍',
    tinymce: '富文本编辑器',
    markdown: 'Markdown',
    jsonEditor: 'JSON编辑器',
    dndList: '列表拖拽',
    splitPane: 'Splitpane',
    avatarUpload: '头像上传',
    dropzone: 'Dropzone',
    sticky: 'Sticky',
    countTo: 'CountTo',
    componentMixin: '小组件',
    backToTop: '返回顶部',
    dragDialog: '拖拽 Dialog',
    dragKanban: '可拖拽看板',
    charts: '图表',
    keyboardChart: '键盘图表',
    lineChart: '折线图',
    mixChart: '混合图表',
    example: '综合实例',
    nested: '路由嵌套',
    menu1: '菜单1',
    'menu1-1': '菜单1-1',
    'menu1-2': '菜单1-2',
    'menu1-2-1': '菜单1-2-1',
    'menu1-2-2': '菜单1-2-2',
    'menu1-3': '菜单1-3',
    menu2: '菜单2',
    Table: 'Table',
    dynamicTable: '动态Table',
    dragTable: '拖拽Table',
    inlineEditTable: 'Table内编辑',
    complexTable: '综合Table',
    userManagement: '用戶管理',
    treeTable: '树形表格',
    customTreeTable: '自定义树表',
    tab: 'Tab',
    form: '表单',
    createArticle: '创建文章',
    editArticle: '编辑文章',
    articleList: '文章列表',
    errorPages: '错误页面',
    page401: '401',
    page404: '404',
    excel: 'Excel',
    exportExcel: 'Export Excel',
    selectExcel: 'Export Selected',
    uploadExcel: 'Upload Excel',
    zip: 'Zip',
    exportZip: 'Export Zip',
    theme: '换肤',
    clipboardDemo: 'Clipboard',
    i18n: '国际化',
    externalLink: '外链',
    test: '测试菜单'
  },
  navbar: {
    logOut: '退出登录',
    dashboard: '首页',
    github: '项目地址',
    screenfull: '全屏',
    theme: '换肤',
    size: '布局大小',
    hi: '嗨',
    lock: '锁屏'
  },
  login: {
    title: '轼辙云教学平台',
    logIn: '登录',
    tenantCode: '单位ID',
    identifier: '账号',
    credential: '密码',
    password: '密码',
    any: '随便填',
    thirdparty: '第三方登录',
    thirdpartyTips: '本地不能模拟，请结合自己业务进行模拟！！！',
    forget: '忘记密码？',
    info: '你咋忘不了吃呢？'
  },
  documentation: {
    documentation: '文档',
    github: 'Github 地址'
  },
  permission: {
    roles: '你的权限',
    switchRoles: '切换权限'
  },
  guide: {
    description: '引导页对于一些第一次进入项目的人很有用，你可以简单介绍下项目的功能。本 Demo 是基于',
    button: '打开引导'
  },
  components: {
    documentation: '文档',
    tinymceTips: '富文本是管理后台一个核心的功能，但同时又是一个有很多坑的地方。在选择富文本的过程中我也走了不少的弯路，市面上常见的富文本都基本用过了，最终权衡了一下选择了Tinymce。更详细的富文本比较和介绍见',
    dropzoneTips: '由于我司业务有特殊需求，而且要传七牛 所以没用第三方，选择了自己封装。代码非常的简单，具体代码你可以在这里看到 @/components/Dropzone',
    stickyTips: '当页面滚动到预设的位置会吸附在顶部',
    backToTopTips1: '页面滚动到指定位置会在右下角出现返回顶部按钮',
    backToTopTips2: '可自定义按钮的样式、show/hide、出现的高度、返回的位置 如需文字提示，可在外部使用Element的el-tooltip元素',
    imageUploadTips: '由于我在使用时它只有vue@1版本，而且和mockjs不兼容，所以自己改造了一下，如果大家要使用的话，优先还是使用官方版本。'
  },
  table: {
    dynamicTips1: '固定表头, 按照表头顺序排序',
    dynamicTips2: '不固定表头, 按照点击顺序排序',
    dragTips1: '默认顺序',
    dragTips2: '拖拽后顺序',
    title: '标题',
    importance: '重要性',
    type: '类型',
    remark: '备注',
    search: '搜索',
    query: '查询',
    add: '新增',
    del: '删除',
    import: '导入',
    export: '导出',
    reviewer: '审核人',
    id: '序号',
    date: '时间',
    author: '作者',
    readings: '阅读数',
    status: '状态',
    isDefault: '是否默认',
    actions: '操作',
    edit: '修改',
    view: '查看',
    preview: '预览',
    publish: '发布',
    draft: '草稿',
    delete: '删除',
    cancel: '取 消',
    confirm: '确 定',
    save: '保存',
    select: '选择',
    saveAndAdd: '保存并添加',
    username: '账号',
    name: '姓名',
    email: '邮箱',
    phone: '电话号码',
    sex: '性别',
    born: '出生日期',
    enable: '启用',
    disable: '禁用',
    resetPassword: '重置密码',
    loginTime: '最近登录时间',
    roleName: '角色名称',
    roleCode: '角色代码',
    roleDesc: '角色描述',
    ownDept: '部门',
    role: '角色',
    permission: '分配权限',
    attachment: '附件',
    attachName: '附件名称',
    attachSize: '附件大小',
    upload: '上传',
    download: '下载',
    downloadUrl: '复制下载链接',
    uploader: '上传者',
    uploadDate: '上传时间',
    courseName: '课程名称',
    course: '所属课程',
    courseDescription: '课程描述',
    college: '学院',
    major: '专业',
    teacher: '老师',
    examinationName: '考试名称',
    examinationType: '考试类型',
    attention: '注意事项',
    startTime: '开始时间',
    endTime: '结束时间',
    examTime: '考试时间',
    totalScore: '总分',
    totalSubject: '题目数',
    subjectManagement: '题目管理',
    subjectName: '题目名称',
    userAnswer: '考生答案',
    correct: '正确',
    inCorrect: '错误',
    time: '耗时',
    answerCorrectType: '答题结果',
    score: '得分',
    modifyDate: '修改时间',
    modifier: '修改人',
    share: '分享',
    shareV2: '分享（v2）',
    subject: {
      serialNumber: '序号',
      type: '类型',
      level: '难度',
      score: '分值',
      content: '题目内容',
      category: '分类',
      optionA: '选项A',
      optionB: '选项B',
      optionC: '选项C',
      optionD: '选项D',
      optionE: '选项E',
      optionF: '选项F',
      answer: '参考答案',
      analysis: '解析'
    },
    public: '发布',
    withdraw: '撤回',
    categoryName: '分类名称',
    categoryDesc: '分类描述',
    sort: '排序号',
    addFromSubjectBank: '从题库新增',
    examRecord: {
      userName: '姓名',
      deptName: '部门',
      score: '成绩',
      examTime: '考试时间',
      submitStatus: '状态',
      details: '详情',
      marking: '批改',
      markStatus: '批改状态'
    },
    knowledge: {
      knowledgeName: '名称',
      knowledgeDesc: '描述',
      status: '状态'
    },
    log: {
      title: '标题',
      ip: 'IP',
      userAgent: '浏览器',
      requestUri: '请求接口',
      type: '类型',
      method: '请求方式',
      params: '参数',
      exception: '异常信息',
      serviceId: '服务ID',
      time: '耗时(ms)',
      creator: '操作人',
      createDate: '操作时间'
    },
    client: {
      clientId: '客户端ID',
      clientSecret: '密钥密文',
      clientSecretPlainText: '密钥明文',
      scope: '授权范围',
      authorizedGrantTypes: '授权类型',
      accessTokenValidity: 'token有效期/秒',
      refreshTokenValidity: 'refresh_token有效期/秒'
    },
    route: {
      routeId: '路由ID',
      routeName: '路由名称',
      predicates: '断言',
      filters: '过滤器',
      uri: 'URI',
      sort: '排序',
      status: '状态',
      refresh: '刷新路由'
    },
    tenant: {
      tenantCode: '单位标识',
      tenantName: '单位名称',
      tenantDesc: '单位描述',
      status: '状态'
    }
  },
  excel: {
    export: '导出',
    selectedExport: '导出已选择项',
    placeholder: '请输入文件名(默认excel-list)'
  },
  zip: {
    export: '导出',
    placeholder: '请输入文件名(默认file)'
  },
  theme: {
    change: '换肤',
    documentation: '换肤文档',
    tips: 'Tips: 它区别于 navbar 上的 theme-pick, 是两种不同的换肤方法，各自有不同的应用场景，具体请参考文档。'
  },
  tagsView: {
    close: '关闭',
    closeOthers: '关闭其它',
    closeAll: '关闭所有'
  }
}
