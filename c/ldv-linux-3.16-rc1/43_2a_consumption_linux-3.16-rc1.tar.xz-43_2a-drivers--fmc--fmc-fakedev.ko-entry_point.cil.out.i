extern void __VERIFIER_error() __attribute__ ((__noreturn__));
struct kernel_symbol {
   unsigned long value ;
   char const *name ;
};
struct module;
typedef unsigned char __u8;
typedef unsigned short __u16;
typedef unsigned int __u32;
typedef unsigned long long __u64;
typedef unsigned char u8;
typedef short s16;
typedef unsigned short u16;
typedef int s32;
typedef unsigned int u32;
typedef long long s64;
typedef unsigned long long u64;
typedef long __kernel_long_t;
typedef unsigned long __kernel_ulong_t;
typedef unsigned int __kernel_uid32_t;
typedef unsigned int __kernel_gid32_t;
typedef __kernel_ulong_t __kernel_size_t;
typedef __kernel_long_t __kernel_ssize_t;
typedef long long __kernel_loff_t;
typedef __u32 __kernel_dev_t;
typedef __kernel_dev_t dev_t;
typedef unsigned short umode_t;
typedef _Bool bool;
typedef __kernel_uid32_t uid_t;
typedef __kernel_gid32_t gid_t;
typedef __kernel_loff_t loff_t;
typedef __kernel_size_t size_t;
typedef __kernel_ssize_t ssize_t;
typedef __u8 uint8_t;
typedef __u32 uint32_t;
typedef __u64 uint64_t;
typedef unsigned int gfp_t;
struct __anonstruct_atomic_t_6 {
   int counter ;
};
typedef struct __anonstruct_atomic_t_6 atomic_t;
struct __anonstruct_atomic64_t_7 {
   long counter ;
};
typedef struct __anonstruct_atomic64_t_7 atomic64_t;
struct list_head {
   struct list_head *next ;
   struct list_head *prev ;
};
struct callback_head {
   struct callback_head *next ;
   void (*func)(struct callback_head * ) ;
};
typedef unsigned long pgdval_t;
typedef unsigned long pgprotval_t;
struct pgprot {
   pgprotval_t pgprot ;
};
typedef struct pgprot pgprot_t;
struct __anonstruct_pgd_t_12 {
   pgdval_t pgd ;
};
typedef struct __anonstruct_pgd_t_12 pgd_t;
struct page;
typedef struct page *pgtable_t;
struct file;
struct seq_file;
struct mm_struct;
struct task_struct;
struct cpumask;
struct arch_spinlock;
typedef u16 __ticket_t;
typedef u32 __ticketpair_t;
struct __raw_tickets {
   __ticket_t head ;
   __ticket_t tail ;
};
union __anonunion_ldv_1458_15 {
   __ticketpair_t head_tail ;
   struct __raw_tickets tickets ;
};
struct arch_spinlock {
   union __anonunion_ldv_1458_15 ldv_1458 ;
};
typedef struct arch_spinlock arch_spinlock_t;
typedef void (*ctor_fn_t)(void);
struct device;
struct completion;
struct bug_entry {
   int bug_addr_disp ;
   int file_disp ;
   unsigned short line ;
   unsigned short flags ;
};
struct cpumask {
   unsigned long bits[128U] ;
};
typedef struct cpumask *cpumask_var_t;
struct seq_operations;
struct kmem_cache;
typedef atomic64_t atomic_long_t;
struct lockdep_map;
struct stack_trace {
   unsigned int nr_entries ;
   unsigned int max_entries ;
   unsigned long *entries ;
   int skip ;
};
struct lockdep_subclass_key {
   char __one_byte ;
} __attribute__((__packed__)) ;
struct lock_class_key {
   struct lockdep_subclass_key subkeys[8U] ;
};
struct lock_class {
   struct list_head hash_entry ;
   struct list_head lock_entry ;
   struct lockdep_subclass_key *key ;
   unsigned int subclass ;
   unsigned int dep_gen_id ;
   unsigned long usage_mask ;
   struct stack_trace usage_traces[13U] ;
   struct list_head locks_after ;
   struct list_head locks_before ;
   unsigned int version ;
   unsigned long ops ;
   char const *name ;
   int name_version ;
   unsigned long contention_point[4U] ;
   unsigned long contending_point[4U] ;
};
struct lockdep_map {
   struct lock_class_key *key ;
   struct lock_class *class_cache[2U] ;
   char const *name ;
   int cpu ;
   unsigned long ip ;
};
struct raw_spinlock {
   arch_spinlock_t raw_lock ;
   unsigned int magic ;
   unsigned int owner_cpu ;
   void *owner ;
   struct lockdep_map dep_map ;
};
typedef struct raw_spinlock raw_spinlock_t;
struct __anonstruct_ldv_6346_31 {
   u8 __padding[24U] ;
   struct lockdep_map dep_map ;
};
union __anonunion_ldv_6347_30 {
   struct raw_spinlock rlock ;
   struct __anonstruct_ldv_6346_31 ldv_6346 ;
};
struct spinlock {
   union __anonunion_ldv_6347_30 ldv_6347 ;
};
typedef struct spinlock spinlock_t;
struct user_namespace;
struct __anonstruct_kuid_t_34 {
   uid_t val ;
};
typedef struct __anonstruct_kuid_t_34 kuid_t;
struct __anonstruct_kgid_t_35 {
   gid_t val ;
};
typedef struct __anonstruct_kgid_t_35 kgid_t;
struct __wait_queue_head {
   spinlock_t lock ;
   struct list_head task_list ;
};
typedef struct __wait_queue_head wait_queue_head_t;
struct optimistic_spin_queue;
struct mutex {
   atomic_t count ;
   spinlock_t wait_lock ;
   struct list_head wait_list ;
   struct task_struct *owner ;
   char const *name ;
   void *magic ;
   struct lockdep_map dep_map ;
};
struct rw_semaphore;
struct rw_semaphore {
   long count ;
   raw_spinlock_t wait_lock ;
   struct list_head wait_list ;
   struct task_struct *owner ;
   struct optimistic_spin_queue *osq ;
   struct lockdep_map dep_map ;
};
struct completion {
   unsigned int done ;
   wait_queue_head_t wait ;
};
union ktime {
   s64 tv64 ;
};
typedef union ktime ktime_t;
struct tvec_base;
struct timer_list {
   struct list_head entry ;
   unsigned long expires ;
   struct tvec_base *base ;
   void (*function)(unsigned long ) ;
   unsigned long data ;
   int slack ;
   int start_pid ;
   void *start_site ;
   char start_comm[16U] ;
   struct lockdep_map lockdep_map ;
};
struct workqueue_struct;
struct work_struct;
struct work_struct {
   atomic_long_t data ;
   struct list_head entry ;
   void (*func)(struct work_struct * ) ;
   struct lockdep_map lockdep_map ;
};
struct delayed_work {
   struct work_struct work ;
   struct timer_list timer ;
   struct workqueue_struct *wq ;
   int cpu ;
};
struct pm_message {
   int event ;
};
typedef struct pm_message pm_message_t;
struct dev_pm_ops {
   int (*prepare)(struct device * ) ;
   void (*complete)(struct device * ) ;
   int (*suspend)(struct device * ) ;
   int (*resume)(struct device * ) ;
   int (*freeze)(struct device * ) ;
   int (*thaw)(struct device * ) ;
   int (*poweroff)(struct device * ) ;
   int (*restore)(struct device * ) ;
   int (*suspend_late)(struct device * ) ;
   int (*resume_early)(struct device * ) ;
   int (*freeze_late)(struct device * ) ;
   int (*thaw_early)(struct device * ) ;
   int (*poweroff_late)(struct device * ) ;
   int (*restore_early)(struct device * ) ;
   int (*suspend_noirq)(struct device * ) ;
   int (*resume_noirq)(struct device * ) ;
   int (*freeze_noirq)(struct device * ) ;
   int (*thaw_noirq)(struct device * ) ;
   int (*poweroff_noirq)(struct device * ) ;
   int (*restore_noirq)(struct device * ) ;
   int (*runtime_suspend)(struct device * ) ;
   int (*runtime_resume)(struct device * ) ;
   int (*runtime_idle)(struct device * ) ;
};
enum rpm_status {
    RPM_ACTIVE = 0,
    RPM_RESUMING = 1,
    RPM_SUSPENDED = 2,
    RPM_SUSPENDING = 3
} ;
enum rpm_request {
    RPM_REQ_NONE = 0,
    RPM_REQ_IDLE = 1,
    RPM_REQ_SUSPEND = 2,
    RPM_REQ_AUTOSUSPEND = 3,
    RPM_REQ_RESUME = 4
} ;
struct wakeup_source;
struct pm_subsys_data {
   spinlock_t lock ;
   unsigned int refcount ;
   struct list_head clock_list ;
};
struct dev_pm_qos;
struct dev_pm_info {
   pm_message_t power_state ;
   unsigned char can_wakeup : 1 ;
   unsigned char async_suspend : 1 ;
   bool is_prepared ;
   bool is_suspended ;
   bool is_noirq_suspended ;
   bool is_late_suspended ;
   bool ignore_children ;
   bool early_init ;
   bool direct_complete ;
   spinlock_t lock ;
   struct list_head entry ;
   struct completion completion ;
   struct wakeup_source *wakeup ;
   bool wakeup_path ;
   bool syscore ;
   struct timer_list suspend_timer ;
   unsigned long timer_expires ;
   struct work_struct work ;
   wait_queue_head_t wait_queue ;
   atomic_t usage_count ;
   atomic_t child_count ;
   unsigned char disable_depth : 3 ;
   unsigned char idle_notification : 1 ;
   unsigned char request_pending : 1 ;
   unsigned char deferred_resume : 1 ;
   unsigned char run_wake : 1 ;
   unsigned char runtime_auto : 1 ;
   unsigned char no_callbacks : 1 ;
   unsigned char irq_safe : 1 ;
   unsigned char use_autosuspend : 1 ;
   unsigned char timer_autosuspends : 1 ;
   unsigned char memalloc_noio : 1 ;
   enum rpm_request request ;
   enum rpm_status runtime_status ;
   int runtime_error ;
   int autosuspend_delay ;
   unsigned long last_busy ;
   unsigned long active_jiffies ;
   unsigned long suspended_jiffies ;
   unsigned long accounting_timestamp ;
   struct pm_subsys_data *subsys_data ;
   void (*set_latency_tolerance)(struct device * , s32 ) ;
   struct dev_pm_qos *qos ;
};
struct dev_pm_domain {
   struct dev_pm_ops ops ;
};
struct __anonstruct_mm_context_t_101 {
   void *ldt ;
   int size ;
   unsigned short ia32_compat ;
   struct mutex lock ;
   void *vdso ;
};
typedef struct __anonstruct_mm_context_t_101 mm_context_t;
struct rb_node {
   unsigned long __rb_parent_color ;
   struct rb_node *rb_right ;
   struct rb_node *rb_left ;
} __attribute__((__aligned__(sizeof(long )))) ;
struct rb_root {
   struct rb_node *rb_node ;
};
struct vm_area_struct;
struct xol_area;
struct uprobes_state {
   struct xol_area *xol_area ;
};
struct address_space;
union __anonunion_ldv_14120_138 {
   struct address_space *mapping ;
   void *s_mem ;
};
union __anonunion_ldv_14126_140 {
   unsigned long index ;
   void *freelist ;
   bool pfmemalloc ;
};
struct __anonstruct_ldv_14136_144 {
   unsigned short inuse ;
   unsigned short objects : 15 ;
   unsigned char frozen : 1 ;
};
union __anonunion_ldv_14138_143 {
   atomic_t _mapcount ;
   struct __anonstruct_ldv_14136_144 ldv_14136 ;
   int units ;
};
struct __anonstruct_ldv_14140_142 {
   union __anonunion_ldv_14138_143 ldv_14138 ;
   atomic_t _count ;
};
union __anonunion_ldv_14142_141 {
   unsigned long counters ;
   struct __anonstruct_ldv_14140_142 ldv_14140 ;
   unsigned int active ;
};
struct __anonstruct_ldv_14143_139 {
   union __anonunion_ldv_14126_140 ldv_14126 ;
   union __anonunion_ldv_14142_141 ldv_14142 ;
};
struct __anonstruct_ldv_14150_146 {
   struct page *next ;
   int pages ;
   int pobjects ;
};
struct slab;
union __anonunion_ldv_14155_145 {
   struct list_head lru ;
   struct __anonstruct_ldv_14150_146 ldv_14150 ;
   struct slab *slab_page ;
   struct callback_head callback_head ;
   pgtable_t pmd_huge_pte ;
};
union __anonunion_ldv_14161_147 {
   unsigned long private ;
   spinlock_t *ptl ;
   struct kmem_cache *slab_cache ;
   struct page *first_page ;
};
struct page {
   unsigned long flags ;
   union __anonunion_ldv_14120_138 ldv_14120 ;
   struct __anonstruct_ldv_14143_139 ldv_14143 ;
   union __anonunion_ldv_14155_145 ldv_14155 ;
   union __anonunion_ldv_14161_147 ldv_14161 ;
   unsigned long debug_flags ;
};
struct __anonstruct_linear_149 {
   struct rb_node rb ;
   unsigned long rb_subtree_last ;
};
union __anonunion_shared_148 {
   struct __anonstruct_linear_149 linear ;
   struct list_head nonlinear ;
};
struct anon_vma;
struct vm_operations_struct;
struct mempolicy;
struct vm_area_struct {
   unsigned long vm_start ;
   unsigned long vm_end ;
   struct vm_area_struct *vm_next ;
   struct vm_area_struct *vm_prev ;
   struct rb_node vm_rb ;
   unsigned long rb_subtree_gap ;
   struct mm_struct *vm_mm ;
   pgprot_t vm_page_prot ;
   unsigned long vm_flags ;
   union __anonunion_shared_148 shared ;
   struct list_head anon_vma_chain ;
   struct anon_vma *anon_vma ;
   struct vm_operations_struct const *vm_ops ;
   unsigned long vm_pgoff ;
   struct file *vm_file ;
   void *vm_private_data ;
   struct mempolicy *vm_policy ;
};
struct core_thread {
   struct task_struct *task ;
   struct core_thread *next ;
};
struct core_state {
   atomic_t nr_threads ;
   struct core_thread dumper ;
   struct completion startup ;
};
struct mm_rss_stat {
   atomic_long_t count[3U] ;
};
struct kioctx_table;
struct linux_binfmt;
struct mmu_notifier_mm;
struct mm_struct {
   struct vm_area_struct *mmap ;
   struct rb_root mm_rb ;
   u32 vmacache_seqnum ;
   unsigned long (*get_unmapped_area)(struct file * , unsigned long , unsigned long ,
                                      unsigned long , unsigned long ) ;
   unsigned long mmap_base ;
   unsigned long mmap_legacy_base ;
   unsigned long task_size ;
   unsigned long highest_vm_end ;
   pgd_t *pgd ;
   atomic_t mm_users ;
   atomic_t mm_count ;
   atomic_long_t nr_ptes ;
   int map_count ;
   spinlock_t page_table_lock ;
   struct rw_semaphore mmap_sem ;
   struct list_head mmlist ;
   unsigned long hiwater_rss ;
   unsigned long hiwater_vm ;
   unsigned long total_vm ;
   unsigned long locked_vm ;
   unsigned long pinned_vm ;
   unsigned long shared_vm ;
   unsigned long exec_vm ;
   unsigned long stack_vm ;
   unsigned long def_flags ;
   unsigned long start_code ;
   unsigned long end_code ;
   unsigned long start_data ;
   unsigned long end_data ;
   unsigned long start_brk ;
   unsigned long brk ;
   unsigned long start_stack ;
   unsigned long arg_start ;
   unsigned long arg_end ;
   unsigned long env_start ;
   unsigned long env_end ;
   unsigned long saved_auxv[46U] ;
   struct mm_rss_stat rss_stat ;
   struct linux_binfmt *binfmt ;
   cpumask_var_t cpu_vm_mask_var ;
   mm_context_t context ;
   unsigned long flags ;
   struct core_state *core_state ;
   spinlock_t ioctx_lock ;
   struct kioctx_table *ioctx_table ;
   struct task_struct *owner ;
   struct file *exe_file ;
   struct mmu_notifier_mm *mmu_notifier_mm ;
   struct cpumask cpumask_allocation ;
   unsigned long numa_next_scan ;
   unsigned long numa_scan_offset ;
   int numa_scan_seq ;
   bool tlb_flush_pending ;
   struct uprobes_state uprobes_state ;
};
typedef __u64 Elf64_Addr;
typedef __u16 Elf64_Half;
typedef __u32 Elf64_Word;
typedef __u64 Elf64_Xword;
struct elf64_sym {
   Elf64_Word st_name ;
   unsigned char st_info ;
   unsigned char st_other ;
   Elf64_Half st_shndx ;
   Elf64_Addr st_value ;
   Elf64_Xword st_size ;
};
typedef struct elf64_sym Elf64_Sym;
union __anonunion_ldv_14524_153 {
   unsigned long bitmap[4U] ;
   struct callback_head callback_head ;
};
struct idr_layer {
   int prefix ;
   int layer ;
   struct idr_layer *ary[256U] ;
   int count ;
   union __anonunion_ldv_14524_153 ldv_14524 ;
};
struct idr {
   struct idr_layer *hint ;
   struct idr_layer *top ;
   int layers ;
   int cur ;
   spinlock_t lock ;
   int id_free_cnt ;
   struct idr_layer *id_free ;
};
struct ida_bitmap {
   long nr_busy ;
   unsigned long bitmap[15U] ;
};
struct ida {
   struct idr idr ;
   struct ida_bitmap *free_bitmap ;
};
struct kernfs_open_node;
struct kernfs_iattrs;
struct kernfs_root;
struct kernfs_elem_dir {
   unsigned long subdirs ;
   struct rb_root children ;
   struct kernfs_root *root ;
};
struct kernfs_node;
struct kernfs_elem_symlink {
   struct kernfs_node *target_kn ;
};
struct kernfs_ops;
struct kernfs_elem_attr {
   struct kernfs_ops const *ops ;
   struct kernfs_open_node *open ;
   loff_t size ;
};
union __anonunion_ldv_14668_154 {
   struct kernfs_elem_dir dir ;
   struct kernfs_elem_symlink symlink ;
   struct kernfs_elem_attr attr ;
};
struct kernfs_node {
   atomic_t count ;
   atomic_t active ;
   struct lockdep_map dep_map ;
   struct kernfs_node *parent ;
   char const *name ;
   struct rb_node rb ;
   void const *ns ;
   unsigned int hash ;
   union __anonunion_ldv_14668_154 ldv_14668 ;
   void *priv ;
   unsigned short flags ;
   umode_t mode ;
   unsigned int ino ;
   struct kernfs_iattrs *iattr ;
};
struct kernfs_syscall_ops {
   int (*remount_fs)(struct kernfs_root * , int * , char * ) ;
   int (*show_options)(struct seq_file * , struct kernfs_root * ) ;
   int (*mkdir)(struct kernfs_node * , char const * , umode_t ) ;
   int (*rmdir)(struct kernfs_node * ) ;
   int (*rename)(struct kernfs_node * , struct kernfs_node * , char const * ) ;
};
struct kernfs_root {
   struct kernfs_node *kn ;
   unsigned int flags ;
   struct ida ino_ida ;
   struct kernfs_syscall_ops *syscall_ops ;
   struct list_head supers ;
   wait_queue_head_t deactivate_waitq ;
};
struct kernfs_open_file {
   struct kernfs_node *kn ;
   struct file *file ;
   void *priv ;
   struct mutex mutex ;
   int event ;
   struct list_head list ;
   size_t atomic_write_len ;
   bool mmapped ;
   struct vm_operations_struct const *vm_ops ;
};
struct kernfs_ops {
   int (*seq_show)(struct seq_file * , void * ) ;
   void *(*seq_start)(struct seq_file * , loff_t * ) ;
   void *(*seq_next)(struct seq_file * , void * , loff_t * ) ;
   void (*seq_stop)(struct seq_file * , void * ) ;
   ssize_t (*read)(struct kernfs_open_file * , char * , size_t , loff_t ) ;
   size_t atomic_write_len ;
   ssize_t (*write)(struct kernfs_open_file * , char * , size_t , loff_t ) ;
   int (*mmap)(struct kernfs_open_file * , struct vm_area_struct * ) ;
   struct lock_class_key lockdep_key ;
};
struct sock;
struct kobject;
enum kobj_ns_type {
    KOBJ_NS_TYPE_NONE = 0,
    KOBJ_NS_TYPE_NET = 1,
    KOBJ_NS_TYPES = 2
} ;
struct kobj_ns_type_operations {
   enum kobj_ns_type type ;
   bool (*current_may_mount)(void) ;
   void *(*grab_current_ns)(void) ;
   void const *(*netlink_ns)(struct sock * ) ;
   void const *(*initial_ns)(void) ;
   void (*drop_ns)(void * ) ;
};
struct bin_attribute;
struct attribute {
   char const *name ;
   umode_t mode ;
   bool ignore_lockdep ;
   struct lock_class_key *key ;
   struct lock_class_key skey ;
};
struct attribute_group {
   char const *name ;
   umode_t (*is_visible)(struct kobject * , struct attribute * , int ) ;
   struct attribute **attrs ;
   struct bin_attribute **bin_attrs ;
};
struct bin_attribute {
   struct attribute attr ;
   size_t size ;
   void *private ;
   ssize_t (*read)(struct file * , struct kobject * , struct bin_attribute * , char * ,
                   loff_t , size_t ) ;
   ssize_t (*write)(struct file * , struct kobject * , struct bin_attribute * , char * ,
                    loff_t , size_t ) ;
   int (*mmap)(struct file * , struct kobject * , struct bin_attribute * , struct vm_area_struct * ) ;
};
struct sysfs_ops {
   ssize_t (*show)(struct kobject * , struct attribute * , char * ) ;
   ssize_t (*store)(struct kobject * , struct attribute * , char const * , size_t ) ;
};
struct kref {
   atomic_t refcount ;
};
struct kset;
struct kobj_type;
struct kobject {
   char const *name ;
   struct list_head entry ;
   struct kobject *parent ;
   struct kset *kset ;
   struct kobj_type *ktype ;
   struct kernfs_node *sd ;
   struct kref kref ;
   struct delayed_work release ;
   unsigned char state_initialized : 1 ;
   unsigned char state_in_sysfs : 1 ;
   unsigned char state_add_uevent_sent : 1 ;
   unsigned char state_remove_uevent_sent : 1 ;
   unsigned char uevent_suppress : 1 ;
};
struct kobj_type {
   void (*release)(struct kobject * ) ;
   struct sysfs_ops const *sysfs_ops ;
   struct attribute **default_attrs ;
   struct kobj_ns_type_operations const *(*child_ns_type)(struct kobject * ) ;
   void const *(*namespace)(struct kobject * ) ;
};
struct kobj_uevent_env {
   char *argv[3U] ;
   char *envp[32U] ;
   int envp_idx ;
   char buf[2048U] ;
   int buflen ;
};
struct kset_uevent_ops {
   int (* const filter)(struct kset * , struct kobject * ) ;
   char const *(* const name)(struct kset * , struct kobject * ) ;
   int (* const uevent)(struct kset * , struct kobject * , struct kobj_uevent_env * ) ;
};
struct kset {
   struct list_head list ;
   spinlock_t list_lock ;
   struct kobject kobj ;
   struct kset_uevent_ops const *uevent_ops ;
};
struct kernel_param;
struct kernel_param_ops {
   unsigned int flags ;
   int (*set)(char const * , struct kernel_param const * ) ;
   int (*get)(char * , struct kernel_param const * ) ;
   void (*free)(void * ) ;
};
struct kparam_string;
struct kparam_array;
union __anonunion_ldv_15343_155 {
   void *arg ;
   struct kparam_string const *str ;
   struct kparam_array const *arr ;
};
struct kernel_param {
   char const *name ;
   struct kernel_param_ops const *ops ;
   u16 perm ;
   s16 level ;
   union __anonunion_ldv_15343_155 ldv_15343 ;
};
struct kparam_string {
   unsigned int maxlen ;
   char *string ;
};
struct kparam_array {
   unsigned int max ;
   unsigned int elemsize ;
   unsigned int *num ;
   struct kernel_param_ops const *ops ;
   void *elem ;
};
struct mod_arch_specific {
};
struct module_param_attrs;
struct module_kobject {
   struct kobject kobj ;
   struct module *mod ;
   struct kobject *drivers_dir ;
   struct module_param_attrs *mp ;
   struct completion *kobj_completion ;
};
struct module_attribute {
   struct attribute attr ;
   ssize_t (*show)(struct module_attribute * , struct module_kobject * , char * ) ;
   ssize_t (*store)(struct module_attribute * , struct module_kobject * , char const * ,
                    size_t ) ;
   void (*setup)(struct module * , char const * ) ;
   int (*test)(struct module * ) ;
   void (*free)(struct module * ) ;
};
struct exception_table_entry;
enum module_state {
    MODULE_STATE_LIVE = 0,
    MODULE_STATE_COMING = 1,
    MODULE_STATE_GOING = 2,
    MODULE_STATE_UNFORMED = 3
} ;
struct module_ref {
   unsigned long incs ;
   unsigned long decs ;
};
struct module_sect_attrs;
struct module_notes_attrs;
struct tracepoint;
struct ftrace_event_call;
struct module {
   enum module_state state ;
   struct list_head list ;
   char name[56U] ;
   struct module_kobject mkobj ;
   struct module_attribute *modinfo_attrs ;
   char const *version ;
   char const *srcversion ;
   struct kobject *holders_dir ;
   struct kernel_symbol const *syms ;
   unsigned long const *crcs ;
   unsigned int num_syms ;
   struct kernel_param *kp ;
   unsigned int num_kp ;
   unsigned int num_gpl_syms ;
   struct kernel_symbol const *gpl_syms ;
   unsigned long const *gpl_crcs ;
   struct kernel_symbol const *unused_syms ;
   unsigned long const *unused_crcs ;
   unsigned int num_unused_syms ;
   unsigned int num_unused_gpl_syms ;
   struct kernel_symbol const *unused_gpl_syms ;
   unsigned long const *unused_gpl_crcs ;
   bool sig_ok ;
   struct kernel_symbol const *gpl_future_syms ;
   unsigned long const *gpl_future_crcs ;
   unsigned int num_gpl_future_syms ;
   unsigned int num_exentries ;
   struct exception_table_entry *extable ;
   int (*init)(void) ;
   void *module_init ;
   void *module_core ;
   unsigned int init_size ;
   unsigned int core_size ;
   unsigned int init_text_size ;
   unsigned int core_text_size ;
   unsigned int init_ro_size ;
   unsigned int core_ro_size ;
   struct mod_arch_specific arch ;
   unsigned int taints ;
   unsigned int num_bugs ;
   struct list_head bug_list ;
   struct bug_entry *bug_table ;
   Elf64_Sym *symtab ;
   Elf64_Sym *core_symtab ;
   unsigned int num_symtab ;
   unsigned int core_num_syms ;
   char *strtab ;
   char *core_strtab ;
   struct module_sect_attrs *sect_attrs ;
   struct module_notes_attrs *notes_attrs ;
   char *args ;
   void *percpu ;
   unsigned int percpu_size ;
   unsigned int num_tracepoints ;
   struct tracepoint * const *tracepoints_ptrs ;
   unsigned int num_trace_bprintk_fmt ;
   char const **trace_bprintk_fmt_start ;
   struct ftrace_event_call **trace_events ;
   unsigned int num_trace_events ;
   unsigned int num_ftrace_callsites ;
   unsigned long *ftrace_callsites ;
   struct list_head source_list ;
   struct list_head target_list ;
   void (*exit)(void) ;
   struct module_ref *refptr ;
   ctor_fn_t (**ctors)(void) ;
   unsigned int num_ctors ;
};
struct mem_cgroup;
struct kmem_cache_cpu {
   void **freelist ;
   unsigned long tid ;
   struct page *page ;
   struct page *partial ;
   unsigned int stat[26U] ;
};
struct kmem_cache_order_objects {
   unsigned long x ;
};
struct memcg_cache_params;
struct kmem_cache_node;
struct kmem_cache {
   struct kmem_cache_cpu *cpu_slab ;
   unsigned long flags ;
   unsigned long min_partial ;
   int size ;
   int object_size ;
   int offset ;
   int cpu_partial ;
   struct kmem_cache_order_objects oo ;
   struct kmem_cache_order_objects max ;
   struct kmem_cache_order_objects min ;
   gfp_t allocflags ;
   int refcount ;
   void (*ctor)(void * ) ;
   int inuse ;
   int align ;
   int reserved ;
   char const *name ;
   struct list_head list ;
   struct kobject kobj ;
   struct memcg_cache_params *memcg_params ;
   int max_attr_size ;
   struct kset *memcg_kset ;
   int remote_node_defrag_ratio ;
   struct kmem_cache_node *node[1024U] ;
};
struct __anonstruct_ldv_15963_157 {
   struct callback_head callback_head ;
   struct kmem_cache *memcg_caches[0U] ;
};
struct __anonstruct_ldv_15969_158 {
   struct mem_cgroup *memcg ;
   struct list_head list ;
   struct kmem_cache *root_cache ;
   atomic_t nr_pages ;
};
union __anonunion_ldv_15970_156 {
   struct __anonstruct_ldv_15963_157 ldv_15963 ;
   struct __anonstruct_ldv_15969_158 ldv_15969 ;
};
struct memcg_cache_params {
   bool is_root_cache ;
   union __anonunion_ldv_15970_156 ldv_15970 ;
};
struct fmc_driver;
struct fmc_device;
struct klist_node;
struct klist_node {
   void *n_klist ;
   struct list_head n_node ;
   struct kref n_ref ;
};
struct seq_file {
   char *buf ;
   size_t size ;
   size_t from ;
   size_t count ;
   size_t pad_until ;
   loff_t index ;
   loff_t read_pos ;
   u64 version ;
   struct mutex lock ;
   struct seq_operations const *op ;
   int poll_event ;
   struct user_namespace *user_ns ;
   void *private ;
};
struct seq_operations {
   void *(*start)(struct seq_file * , loff_t * ) ;
   void (*stop)(struct seq_file * , void * ) ;
   void *(*next)(struct seq_file * , void * , loff_t * ) ;
   int (*show)(struct seq_file * , void * ) ;
};
struct pinctrl;
struct pinctrl_state;
struct dev_pin_info {
   struct pinctrl *p ;
   struct pinctrl_state *default_state ;
   struct pinctrl_state *sleep_state ;
   struct pinctrl_state *idle_state ;
};
struct dma_map_ops;
struct dev_archdata {
   struct dma_map_ops *dma_ops ;
   void *iommu ;
};
struct device_private;
struct device_driver;
struct driver_private;
struct class;
struct subsys_private;
struct bus_type;
struct device_node;
struct iommu_ops;
struct iommu_group;
struct device_attribute;
struct bus_type {
   char const *name ;
   char const *dev_name ;
   struct device *dev_root ;
   struct device_attribute *dev_attrs ;
   struct attribute_group const **bus_groups ;
   struct attribute_group const **dev_groups ;
   struct attribute_group const **drv_groups ;
   int (*match)(struct device * , struct device_driver * ) ;
   int (*uevent)(struct device * , struct kobj_uevent_env * ) ;
   int (*probe)(struct device * ) ;
   int (*remove)(struct device * ) ;
   void (*shutdown)(struct device * ) ;
   int (*online)(struct device * ) ;
   int (*offline)(struct device * ) ;
   int (*suspend)(struct device * , pm_message_t ) ;
   int (*resume)(struct device * ) ;
   struct dev_pm_ops const *pm ;
   struct iommu_ops *iommu_ops ;
   struct subsys_private *p ;
   struct lock_class_key lock_key ;
};
struct device_type;
struct of_device_id;
struct acpi_device_id;
struct device_driver {
   char const *name ;
   struct bus_type *bus ;
   struct module *owner ;
   char const *mod_name ;
   bool suppress_bind_attrs ;
   struct of_device_id const *of_match_table ;
   struct acpi_device_id const *acpi_match_table ;
   int (*probe)(struct device * ) ;
   int (*remove)(struct device * ) ;
   void (*shutdown)(struct device * ) ;
   int (*suspend)(struct device * , pm_message_t ) ;
   int (*resume)(struct device * ) ;
   struct attribute_group const **groups ;
   struct dev_pm_ops const *pm ;
   struct driver_private *p ;
};
struct class_attribute;
struct class {
   char const *name ;
   struct module *owner ;
   struct class_attribute *class_attrs ;
   struct attribute_group const **dev_groups ;
   struct kobject *dev_kobj ;
   int (*dev_uevent)(struct device * , struct kobj_uevent_env * ) ;
   char *(*devnode)(struct device * , umode_t * ) ;
   void (*class_release)(struct class * ) ;
   void (*dev_release)(struct device * ) ;
   int (*suspend)(struct device * , pm_message_t ) ;
   int (*resume)(struct device * ) ;
   struct kobj_ns_type_operations const *ns_type ;
   void const *(*namespace)(struct device * ) ;
   struct dev_pm_ops const *pm ;
   struct subsys_private *p ;
};
struct class_attribute {
   struct attribute attr ;
   ssize_t (*show)(struct class * , struct class_attribute * , char * ) ;
   ssize_t (*store)(struct class * , struct class_attribute * , char const * , size_t ) ;
};
struct device_type {
   char const *name ;
   struct attribute_group const **groups ;
   int (*uevent)(struct device * , struct kobj_uevent_env * ) ;
   char *(*devnode)(struct device * , umode_t * , kuid_t * , kgid_t * ) ;
   void (*release)(struct device * ) ;
   struct dev_pm_ops const *pm ;
};
struct device_attribute {
   struct attribute attr ;
   ssize_t (*show)(struct device * , struct device_attribute * , char * ) ;
   ssize_t (*store)(struct device * , struct device_attribute * , char const * ,
                    size_t ) ;
};
struct device_dma_parameters {
   unsigned int max_segment_size ;
   unsigned long segment_boundary_mask ;
};
struct acpi_device;
struct acpi_dev_node {
   struct acpi_device *companion ;
};
struct dma_coherent_mem;
struct cma;
struct device {
   struct device *parent ;
   struct device_private *p ;
   struct kobject kobj ;
   char const *init_name ;
   struct device_type const *type ;
   struct mutex mutex ;
   struct bus_type *bus ;
   struct device_driver *driver ;
   void *platform_data ;
   void *driver_data ;
   struct dev_pm_info power ;
   struct dev_pm_domain *pm_domain ;
   struct dev_pin_info *pins ;
   int numa_node ;
   u64 *dma_mask ;
   u64 coherent_dma_mask ;
   unsigned long dma_pfn_offset ;
   struct device_dma_parameters *dma_parms ;
   struct list_head dma_pools ;
   struct dma_coherent_mem *dma_mem ;
   struct cma *cma_area ;
   struct dev_archdata archdata ;
   struct device_node *of_node ;
   struct acpi_dev_node acpi_node ;
   dev_t devt ;
   u32 id ;
   spinlock_t devres_lock ;
   struct list_head devres_head ;
   struct klist_node knode_class ;
   struct class *class ;
   struct attribute_group const **groups ;
   void (*release)(struct device * ) ;
   struct iommu_group *iommu_group ;
   bool offline_disabled ;
   bool offline ;
};
struct wakeup_source {
   char const *name ;
   struct list_head entry ;
   spinlock_t lock ;
   struct timer_list timer ;
   unsigned long timer_expires ;
   ktime_t total_time ;
   ktime_t max_time ;
   ktime_t last_time ;
   ktime_t start_prevent_time ;
   ktime_t prevent_sleep_time ;
   unsigned long event_count ;
   unsigned long active_count ;
   unsigned long relax_count ;
   unsigned long expire_count ;
   unsigned long wakeup_count ;
   bool active ;
   bool autosleep_enabled ;
};
struct firmware {
   size_t size ;
   u8 const *data ;
   struct page **pages ;
   void *priv ;
};
enum irqreturn {
    IRQ_NONE = 0,
    IRQ_HANDLED = 1,
    IRQ_WAKE_THREAD = 2
} ;
typedef enum irqreturn irqreturn_t;
struct exception_table_entry {
   int insn ;
   int fixup ;
};
struct fmc_fru_id {
   char *manufacturer ;
   char *product_name ;
};
struct fmc_sdb_one_id {
   uint64_t vendor ;
   uint32_t device ;
};
struct fmc_sdb_id {
   struct fmc_sdb_one_id *cores ;
   int cores_nr ;
};
struct fmc_device_id {
   struct fmc_fru_id *fru_id ;
   int fru_id_nr ;
   struct fmc_sdb_id *sdb_id ;
   int sdb_id_nr ;
};
struct fmc_driver {
   unsigned long version ;
   struct device_driver driver ;
   int (*probe)(struct fmc_device * ) ;
   int (*remove)(struct fmc_device * ) ;
   struct fmc_device_id const id_table ;
   int busid_n ;
   int busid_val[32U] ;
   int gw_n ;
   char *gw_val[32U] ;
};
struct fmc_gpio {
   char *carrier_name ;
   int gpio ;
   int _gpio ;
   int mode ;
   int irqmode ;
};
struct fmc_operations {
   uint32_t (*read32)(struct fmc_device * , int ) ;
   void (*write32)(struct fmc_device * , uint32_t , int ) ;
   int (*validate)(struct fmc_device * , struct fmc_driver * ) ;
   int (*reprogram)(struct fmc_device * , struct fmc_driver * , char * ) ;
   int (*irq_request)(struct fmc_device * , irqreturn_t (*)(int , void * ) , char * ,
                      int ) ;
   void (*irq_ack)(struct fmc_device * ) ;
   int (*irq_free)(struct fmc_device * ) ;
   int (*gpio_config)(struct fmc_device * , struct fmc_gpio * , int ) ;
   int (*read_ee)(struct fmc_device * , int , void * , int ) ;
   int (*write_ee)(struct fmc_device * , int , void const * , int ) ;
};
struct sdb_array;
struct fmc_device {
   unsigned long version ;
   unsigned long flags ;
   struct module *owner ;
   struct fmc_fru_id id ;
   struct fmc_operations *op ;
   int irq ;
   int eeprom_len ;
   int eeprom_addr ;
   uint8_t *eeprom ;
   char *carrier_name ;
   void *carrier_data ;
   void *fpga_base ;
   void *slot_base ;
   struct fmc_device **devarray ;
   int slot_id ;
   int nr_slots ;
   unsigned long memlen ;
   struct device dev ;
   struct device *hwdev ;
   unsigned long sdbfs_entry ;
   struct sdb_array *sdb ;
   uint32_t device_id ;
   char *mezzanine_name ;
   void *mezzanine_data ;
};
struct ff_dev {
   struct fmc_device *fmc[4U] ;
   struct device dev ;
};
typedef struct page___0 *pgtable_t___0;
struct __anonstruct____missing_field_name_211 {
   unsigned int inuse : 16 ;
   unsigned int objects : 15 ;
   unsigned int frozen : 1 ;
};
union __anonunion____missing_field_name_210 {
   atomic_t _mapcount ;
   struct __anonstruct____missing_field_name_211 __annonCompField39 ;
   int units ;
};
struct __anonstruct____missing_field_name_209 {
   union __anonunion____missing_field_name_210 __annonCompField40 ;
   atomic_t _count ;
};
union __anonunion____missing_field_name_208 {
   unsigned long counters ;
   struct __anonstruct____missing_field_name_209 __annonCompField41 ;
   unsigned int active ;
};
struct __anonstruct____missing_field_name_206 {
   union __anonunion_ldv_14126_140 __annonCompField38 ;
   union __anonunion____missing_field_name_208 __annonCompField42 ;
};
struct __anonstruct____missing_field_name_213 {
   struct page___0 *next ;
   int pages ;
   int pobjects ;
};
union __anonunion____missing_field_name_212 {
   struct list_head lru ;
   struct __anonstruct____missing_field_name_213 __annonCompField44 ;
   struct slab *slab_page ;
   struct callback_head callback_head ;
   pgtable_t___0 pmd_huge_pte ;
};
union __anonunion____missing_field_name_214 {
   unsigned long private ;
   spinlock_t *ptl ;
   struct kmem_cache___0 *slab_cache ;
   struct page___0 *first_page ;
};
struct page___0 {
   unsigned long flags ;
   union __anonunion_ldv_14120_138 __annonCompField37 ;
   struct __anonstruct____missing_field_name_206 __annonCompField43 ;
   union __anonunion____missing_field_name_212 __annonCompField45 ;
   union __anonunion____missing_field_name_214 __annonCompField46 ;
   unsigned long debug_flags ;
} __attribute__((__aligned__((2) * (sizeof(unsigned long )) ))) ;
enum kobj_ns_type;
struct attribute___0 {
   char const *name ;
   umode_t mode ;
   bool ignore_lockdep : 1 ;
   struct lock_class_key *key ;
   struct lock_class_key skey ;
};
struct sysfs_ops___0 {
   ssize_t (*show)(struct kobject___0 * , struct attribute___0 * , char * ) ;
   ssize_t (*store)(struct kobject___0 * , struct attribute___0 * , char const * ,
                    size_t ) ;
};
struct kobject___0 {
   char const *name ;
   struct list_head entry ;
   struct kobject___0 *parent ;
   struct kset *kset ;
   struct kobj_type___0 *ktype ;
   struct kernfs_node *sd ;
   struct kref kref ;
   struct delayed_work release ;
   unsigned int state_initialized : 1 ;
   unsigned int state_in_sysfs : 1 ;
   unsigned int state_add_uevent_sent : 1 ;
   unsigned int state_remove_uevent_sent : 1 ;
   unsigned int uevent_suppress : 1 ;
};
struct kobj_type___0 {
   void (*release)(struct kobject___0 *kobj ) ;
   struct sysfs_ops___0 const *sysfs_ops ;
   struct attribute___0 **default_attrs ;
   struct kobj_ns_type_operations const *(*child_ns_type)(struct kobject___0 *kobj ) ;
   void const *(*namespace)(struct kobject___0 *kobj ) ;
};
struct kmem_cache_cpu___0 {
   void **freelist ;
   unsigned long tid ;
   struct page___0 *page ;
   struct page___0 *partial ;
   unsigned int stat[26] ;
};
struct kmem_cache___0 {
   struct kmem_cache_cpu___0 *cpu_slab ;
   unsigned long flags ;
   unsigned long min_partial ;
   int size ;
   int object_size ;
   int offset ;
   int cpu_partial ;
   struct kmem_cache_order_objects oo ;
   struct kmem_cache_order_objects max ;
   struct kmem_cache_order_objects min ;
   gfp_t allocflags ;
   int refcount ;
   void (*ctor)(void * ) ;
   int inuse ;
   int align ;
   int reserved ;
   char const *name ;
   struct list_head list ;
   struct kobject___0 kobj ;
   struct memcg_cache_params___0 *memcg_params ;
   int max_attr_size ;
   struct kset *memcg_kset ;
   int remote_node_defrag_ratio ;
   struct kmem_cache_node *node[1 << 10] ;
};
struct __anonstruct____missing_field_name_227 {
   struct callback_head callback_head ;
   struct kmem_cache___0 *memcg_caches[0] ;
};
struct __anonstruct____missing_field_name_228 {
   struct mem_cgroup *memcg ;
   struct list_head list ;
   struct kmem_cache___0 *root_cache ;
   atomic_t nr_pages ;
};
union __anonunion____missing_field_name_226 {
   struct __anonstruct____missing_field_name_227 __annonCompField50 ;
   struct __anonstruct____missing_field_name_228 __annonCompField51 ;
};
struct memcg_cache_params___0 {
   bool is_root_cache ;
   union __anonunion____missing_field_name_226 __annonCompField52 ;
};
long ldv__builtin_expect(long exp , long c ) ;
extern struct module __this_module ;
extern int printk(char const * , ...) ;
extern void *memcpy(void * , void const * , size_t ) ;
extern void *memset(void * , int , size_t ) ;
extern size_t strlen(char const * ) ;
extern void *kmemdup(void const * , size_t , gfp_t ) ;
__inline static void *ERR_PTR(long error )
{
  {
  return ((void *)error);
}
}
__inline static long PTR_ERR(void const *ptr )
{
  {
  return ((long )ptr);
}
}
__inline static bool IS_ERR(void const *ptr )
{
  long tmp ;
  {
  tmp = ldv__builtin_expect((unsigned long )ptr > 0xfffffffffffff000UL, 0L);
  return (tmp != 0L);
}
}
extern struct tvec_base boot_tvec_bases ;
extern void delayed_work_timer_fn(unsigned long ) ;
extern struct workqueue_struct *system_wq ;
extern bool queue_delayed_work_on(int , struct workqueue_struct * , struct delayed_work * ,
                                  unsigned long ) ;
extern bool cancel_delayed_work_sync(struct delayed_work * ) ;
__inline static bool queue_delayed_work(struct workqueue_struct *wq , struct delayed_work *dwork ,
                                        unsigned long delay )
{
  bool tmp ;
  {
  tmp = queue_delayed_work_on(8192, wq, dwork, delay);
  return (tmp);
}
}
__inline static bool schedule_delayed_work(struct delayed_work *dwork , unsigned long delay )
{
  bool tmp ;
  {
  tmp = queue_delayed_work(system_wq, dwork, delay);
  return (tmp);
}
}
extern void kfree(void const * ) ;
extern void *kmem_cache_alloc(struct kmem_cache * , gfp_t ) ;
void *ldv_kmem_cache_alloc_16(struct kmem_cache *ldv_func_arg1 , gfp_t flags ) ;
__inline static void *kzalloc(size_t size , gfp_t flags ) ;
void ldv_check_alloc_flags(gfp_t flags ) ;
extern void *malloc(size_t size ) ;
extern void *calloc(size_t nmemb , size_t size ) ;
extern int __VERIFIER_nondet_int(void) ;
extern unsigned long __VERIFIER_nondet_ulong(void) ;
extern void *__VERIFIER_nondet_pointer(void) ;
extern void __VERIFIER_assume(int expression ) ;
void *ldv_malloc(size_t size )
{
  void *p ;
  void *tmp ;
  int tmp___0 ;
  {
  tmp___0 = __VERIFIER_nondet_int();
  if (tmp___0 != 0) {
    return ((void *)0);
  } else {
    tmp = malloc(size);
    p = tmp;
    __VERIFIER_assume((unsigned long )p != (unsigned long )((void *)0));
    return (p);
  }
}
}
void *ldv_zalloc(size_t size )
{
  void *p ;
  void *tmp ;
  int tmp___0 ;
  {
  tmp___0 = __VERIFIER_nondet_int();
  if (tmp___0 != 0) {
    return ((void *)0);
  } else {
    tmp = calloc(1UL, size);
    p = tmp;
    __VERIFIER_assume((unsigned long )p != (unsigned long )((void *)0));
    return (p);
  }
}
}
int ldv_undef_int(void)
{
  int tmp ;
  {
  tmp = __VERIFIER_nondet_int();
  return (tmp);
}
}
void *ldv_undef_ptr(void)
{
  void *tmp ;
  {
  tmp = __VERIFIER_nondet_pointer();
  return (tmp);
}
}
unsigned long ldv_undef_ulong(void)
{
  unsigned long tmp ;
  {
  tmp = __VERIFIER_nondet_ulong();
  return (tmp);
}
}
__inline static void ldv_error(void)
{
  {
  ERROR: ;
  __VERIFIER_error();
}
}
__inline static void ldv_stop(void)
{
  {
  LDV_STOP: ;
  goto LDV_STOP;
}
}
long ldv__builtin_expect(long exp , long c )
{
  {
  return (exp);
}
}
void ldv__builtin_trap(void)
{
  {
  ldv_error();
  return;
}
}
int LDV_IN_INTERRUPT = 1;
int ldv_state_variable_2 ;
int ref_cnt ;
struct fmc_driver *ff_fmc_operations_group0 ;
struct fmc_device *ff_fmc_operations_group1 ;
int ldv_state_variable_1 ;
int ldv_state_variable_0 ;
void ldv_initialize_fmc_operations_1(void) ;
extern int dev_set_name(struct device * , char const * , ...) ;
extern int device_register(struct device * ) ;
extern void device_unregister(struct device * ) ;
extern void put_device(struct device * ) ;
extern int dev_err(struct device const * , char const * , ...) ;
extern int dev_warn(struct device const * , char const * , ...) ;
extern int _dev_info(struct device const * , char const * , ...) ;
extern int request_firmware(struct firmware const ** , char const * , struct device * ) ;
extern void release_firmware(struct firmware const * ) ;
extern int fmc_device_register_n(struct fmc_device ** , int ) ;
extern void fmc_device_unregister_n(struct fmc_device ** , int ) ;
static char *ff_eeprom[4U] ;
static int ff_nr_eeprom ;
static int ff_nr_dev = 1;
static char ff_eeimg[4U][8192U] = { { 1, 0, 0, 1,
            0, 12, 0, -14,
            1, 11, 0, -78,
            -122, -121, -53, 102,
            97, 107, 101, 45,
            118, 101, 110, 100,
            111, 114, -41, 102,
            97, 107, 101, 45,
            100, 101, 115, 105,
            103, 110, 45, 102,
            111, 114, 45, 116,
            101, 115, 116, 105,
            110, 103, -59, 48,
            49, 50, 51, 52,
            -60, 110, 111, 110,
            101, -38, 50, 48,
            49, 50, 45, 49,
            49, 45, 49, 57,
            32, 50, 50, 58,
            52, 50, 58, 51,
            48, 46, 48, 55,
            52, 48, 53, 53,
            -63, 0, 0, 0,
            0, 0, 0, -121,
            2, 2, 13, -9,
            -8, 2, -80, 4,
            116, 4, -20, 4,
            0, 0, 0, 0,
            -24, 3, 2, 2,
            13, 92, -109, 1,
            74, 1, 57, 1,
            90, 1, 0, 0,
            0, 0, -72, 11,
            2, 2, 13, 99,
            -116, 0, -6, 0,
            -19, 0, 6, 1,
            0, 0, 0, 0,
            -96, 15, 1, 2,
            13, -5, -11, 5,
            0, 0, 0, 0,
            0, 0, 0, 0,
            0, 0, 0, 0,
            1, 2, 13, -4,
            -12, 4, 0, 0,
            0, 0, 0, 0,
            0, 0, 0, 0,
            0, 0, 1, 2,
            13, -3, -13, 3,
            0, 0, 0, 0,
            0, 0, 0, 0,
            0, 0, 0, 0,
            -6, -126, 11, -22,
            -113, -94, 18, 0,
            0, 30, 68, 0,
            0, 0, 0, 0,
            0, 0, 0, 0,
            0, 0, 0, 0,
            0, 0, 0, 0,
            0, 0, 0, 0,
            0, 0, 0, 0,
            0, 0, 0, 0,
            0, 0, 0, 0,
            0, 0, 0, 0,
            0, 0, 0, 0,
            83, 68, 66, 45,
            0, 3, 1, 1,
            0, 0, 0, 0,
            0, 0, 1, 0,
            0, 0, 0, 0,
            0, 0, 1, -60,
            70, 105, 108, 101,
            68, 97, 116, 97,
            46, 32, 32, 32,
            0, 0, 0, 1,
            0, 0, 0, 0,
            46, 32, 32, 32,
            32, 32, 32, 32,
            32, 32, 32, 32,
            32, 32, 32, 32,
            32, 32, 32, 0,
            0, 0, 0, 0,
            0, 0, 0, 4,
            0, 0, 0, 0,
            0, 0, 1, -64,
            0, 0, 0, 0,
            0, 0, 1, -60,
            70, 105, 108, 101,
            68, 97, 116, 97,
            110, 97, 109, 101,
            0, 0, 0, 1,
            0, 0, 0, 0,
            110, 97, 109, 101,
            32, 32, 32, 32,
            32, 32, 32, 32,
            32, 32, 32, 32,
            32, 32, 32, 1,
            0, 0, 0, 0,
            0, 0, 0, 4,
            0, 0, 0, 0,
            0, 0, 0, 0,
            0, 0, 0, 0,
            0, 0, 0, -33,
            70, 105, 108, 101,
            68, 97, 116, 97,
            73, 80, 77, 73,
            0, 0, 0, 1,
            0, 0, 0, 0,
            73, 80, 77, 73,
            45, 70, 82, 85,
            32, 32, 32, 32,
            32, 32, 32, 32,
            32, 32, 32, 1,
            102, 97, 107, 101,
            10}};
static struct ff_dev *ff_current_dev ;
static int ff_reprogram(struct fmc_device *fmc , struct fmc_driver *drv , char *gw )
{
  struct firmware const *fw ;
  int ret ;
  {
  if ((unsigned long )gw == (unsigned long )((char *)0)) {
    fmc->flags = fmc->flags & 0xfffffffffffffffdUL;
    fmc->flags = fmc->flags | 1UL;
    return (0);
  } else {
  }
  _dev_info((struct device const *)(& fmc->dev), "reprogramming with %s\n", gw);
  ret = request_firmware(& fw, (char const *)gw, & fmc->dev);
  if (ret < 0) {
    dev_warn((struct device const *)(& fmc->dev), "request firmware \"%s\": error %i\n",
             gw, ret);
    goto out;
  } else {
  }
  fmc->flags = fmc->flags & 0xfffffffffffffffeUL;
  fmc->flags = fmc->flags | 2UL;
  out:
  release_firmware(fw);
  return (ret);
}
}
static int ff_irq_request(struct fmc_device *fmc , irqreturn_t (*handler)(int , void * ) ,
                          char *name , int flags )
{
  {
  return (-95);
}
}
static struct ff_dev *ff_dev_create(void) ;
static void ff_work_fn(struct work_struct *work )
{
  struct ff_dev *ff ;
  int ret ;
  bool tmp ;
  {
  ff = ff_current_dev;
  fmc_device_unregister_n((struct fmc_device **)(& ff->fmc), ff_nr_dev);
  device_unregister(& ff->dev);
  ff_current_dev = (struct ff_dev *)0;
  ff = ff_dev_create();
  tmp = IS_ERR((void const *)ff);
  if ((int )tmp) {
    printk("\f%s: can\'t re-create FMC devices\n", "ff_work_fn");
    return;
  } else {
  }
  ret = fmc_device_register_n((struct fmc_device **)(& ff->fmc), ff_nr_dev);
  if (ret < 0) {
    dev_warn((struct device const *)(& ff->dev), "can\'t re-register FMC devices\n");
    device_unregister(& ff->dev);
    return;
  } else {
  }
  ff_current_dev = ff;
  return;
}
}
static struct delayed_work ff_work = {{{137438953424L}, {& ff_work.work.entry, & ff_work.work.entry}, & ff_work_fn,
     {(struct lock_class_key *)(& ff_work.work), {0, 0}, "(ff_work).work", 0, 0UL}},
    {{0, (struct list_head *)1953723489}, 0UL, (struct tvec_base *)((unsigned long )(& boot_tvec_bases) + 2UL),
     & delayed_work_timer_fn, (unsigned long )(& ff_work), -1, 0, 0, {(char)0, (char)0,
                                                                      (char)0, (char)0,
                                                                      (char)0, (char)0,
                                                                      (char)0, (char)0,
                                                                      (char)0, (char)0,
                                                                      (char)0, (char)0,
                                                                      (char)0, (char)0,
                                                                      (char)0, (char)0},
     {(struct lock_class_key *)"/work/ldvuser/mutilin/launch/work/current--X--drivers--X--defaultlinux-3.16-rc1.tar.xz--X--43_2a--X--cpachecker/linux-3.16-rc1.tar.xz/csd_deg_dscv/882/dscv_tempdir/dscv/ri/43_2a/drivers/fmc/fmc-fakedev.o.c.prepared:191",
      {0, 0}, "/work/ldvuser/mutilin/launch/work/current--X--drivers--X--defaultlinux-3.16-rc1.tar.xz--X--43_2a--X--cpachecker/linux-3.16-rc1.tar.xz/csd_deg_dscv/882/dscv_tempdir/dscv/ri/43_2a/drivers/fmc/fmc-fakedev.o.c.prepared:191",
      0, 0UL}}, 0, 0};
static int ff_eeprom_read(struct fmc_device *fmc , uint32_t offset , void *buf , size_t size )
{
  size_t __len ;
  void *__ret ;
  {
  if (offset > 8192U) {
    return (-22);
  } else {
  }
  if ((size_t )offset + size > 8192UL) {
    size = (size_t )(8192U - offset);
  } else {
  }
  __len = size;
  __ret = memcpy(buf, (void const *)fmc->eeprom + (unsigned long )offset,
                           __len);
  return ((int )size);
}
}
static int ff_eeprom_write(struct fmc_device *fmc , uint32_t offset , void const *buf ,
                           size_t size )
{
  size_t __len ;
  void *__ret ;
  {
  if (offset > 8192U) {
    return (-22);
  } else {
  }
  if ((size_t )offset + size > 8192UL) {
    size = (size_t )(8192U - offset);
  } else {
  }
  _dev_info((struct device const *)(& fmc->dev), "write_eeprom: offset %i, size %zi\n",
            (int )offset, size);
  __len = size;
  __ret = memcpy((void *)fmc->eeprom + (unsigned long )offset, buf, __len);
  schedule_delayed_work(& ff_work, 500UL);
  return ((int )size);
}
}
static int ff_read_ee(struct fmc_device *fmc , int pos , void *data , int len )
{
  int tmp ;
  {
  if ((fmc->flags & 1UL) == 0UL) {
    return (-95);
  } else {
  }
  tmp = ff_eeprom_read(fmc, (uint32_t )pos, data, (size_t )len);
  return (tmp);
}
}
static int ff_write_ee(struct fmc_device *fmc , int pos , void const *data , int len )
{
  int tmp ;
  {
  if ((fmc->flags & 1UL) == 0UL) {
    return (-95);
  } else {
  }
  tmp = ff_eeprom_write(fmc, (uint32_t )pos, data, (size_t )len);
  return (tmp);
}
}
static uint32_t ff_readl(struct fmc_device *fmc , int offset )
{
  {
  return (0U);
}
}
static void ff_writel(struct fmc_device *fmc , uint32_t value , int offset )
{
  {
  return;
}
}
static int ff_validate(struct fmc_device *fmc , struct fmc_driver *drv )
{
  int i ;
  {
  if (drv->busid_n == 0) {
    return (0);
  } else {
  }
  i = 0;
  goto ldv_19577;
  ldv_19576: ;
  if ((uint32_t )drv->busid_val[i] == fmc->device_id) {
    return (i);
  } else {
  }
  i = i + 1;
  ldv_19577: ;
  if (drv->busid_n > i) {
    goto ldv_19576;
  } else {
  }
  return (-2);
}
}
static struct fmc_operations ff_fmc_operations =
     {& ff_readl, & ff_writel, & ff_validate, & ff_reprogram, & ff_irq_request, 0, 0,
    0, & ff_read_ee, & ff_write_ee};
static void ff_dev_release(struct device *dev )
{
  struct ff_dev *ff ;
  struct device const *__mptr ;
  {
  __mptr = (struct device const *)dev;
  ff = (struct ff_dev *)__mptr + 0xffffffffffffffe0UL;
  kfree((void const *)ff);
  return;
}
}
static struct fmc_device ff_template_fmc =
     {196608UL, 1UL, & __this_module, {0, 0}, & ff_fmc_operations, 0, 8192, 0, 0, (char *)"fake-fmc-carrier",
    0, 0, 0, 0, 0, 0, 4096UL, {0, 0, {0, {0, 0}, 0, 0, 0, 0, {{0}}, {{{0L}, {0, 0},
                                                                      0, {0, {0, 0},
                                                                          0, 0, 0UL}},
                                                                     {{0, 0}, 0UL,
                                                                      0, 0, 0UL, 0,
                                                                      0, 0, {(char)0,
                                                                             (char)0,
                                                                             (char)0,
                                                                             (char)0,
                                                                             (char)0,
                                                                             (char)0,
                                                                             (char)0,
                                                                             (char)0,
                                                                             (char)0,
                                                                             (char)0,
                                                                             (char)0,
                                                                             (char)0,
                                                                             (char)0,
                                                                             (char)0,
                                                                             (char)0,
                                                                             (char)0},
                                                                      {0, {0, 0},
                                                                       0, 0, 0UL}},
                                                                     0, 0}, (unsigned char)0,
                                      (unsigned char)0, (unsigned char)0, (unsigned char)0,
                                      (unsigned char)0}, 0, 0, {{0}, {{{{{0U}}, 0U,
                                                                        0U, 0, {0,
                                                                                {0,
                                                                                 0},
                                                                                0,
                                                                                0,
                                                                                0UL}}}},
                                                                {0, 0}, 0, 0, 0, {0,
                                                                                  {0,
                                                                                   0},
                                                                                  0,
                                                                                  0,
                                                                                  0UL}},
                               0, 0, 0, 0, {{0}, (unsigned char)0, (unsigned char)0,
                                            (_Bool)0, (_Bool)0, (_Bool)0, (_Bool)0,
                                            (_Bool)0, (_Bool)0, (_Bool)0, {{{{{0U}},
                                                                             0U, 0U,
                                                                             0, {0,
                                                                                 {0,
                                                                                  0},
                                                                                 0,
                                                                                 0,
                                                                                 0UL}}}},
                                            {0, 0}, {0U, {{{{{{0U}}, 0U, 0U, 0, {0,
                                                                                 {0,
                                                                                  0},
                                                                                 0,
                                                                                 0,
                                                                                 0UL}}}},
                                                          {0, 0}}}, 0, (_Bool)0, (_Bool)0,
                                            {{0, 0}, 0UL, 0, 0, 0UL, 0, 0, 0, {(char)0,
                                                                               (char)0,
                                                                               (char)0,
                                                                               (char)0,
                                                                               (char)0,
                                                                               (char)0,
                                                                               (char)0,
                                                                               (char)0,
                                                                               (char)0,
                                                                               (char)0,
                                                                               (char)0,
                                                                               (char)0,
                                                                               (char)0,
                                                                               (char)0,
                                                                               (char)0,
                                                                               (char)0},
                                             {0, {0, 0}, 0, 0, 0UL}}, 0UL, {{0L},
                                                                            {0, 0},
                                                                            0, {0,
                                                                                {0,
                                                                                 0},
                                                                                0,
                                                                                0,
                                                                                0UL}},
                                            {{{{{{0U}}, 0U, 0U, 0, {0, {0, 0}, 0,
                                                                    0, 0UL}}}}, {0,
                                                                                 0}},
                                            {0}, {0}, (unsigned char)0, (unsigned char)0,
                                            (unsigned char)0, (unsigned char)0, (unsigned char)0,
                                            (unsigned char)0, (unsigned char)0, (unsigned char)0,
                                            (unsigned char)0, (unsigned char)0, (unsigned char)0,
                                            0, 0, 0, 0, 0UL, 0UL, 0UL, 0UL, 0, 0,
                                            0}, 0, 0, 0, 0, 0ULL, 0UL, 0, {0, 0},
                               0, 0, {0, 0}, 0, {0}, 0U, 0U, {{{{{0U}}, 0U, 0U, 0,
                                                                {0, {0, 0}, 0, 0,
                                                                 0UL}}}}, {0, 0},
                               {0, {0, 0}, {{0}}}, 0, 0, 0, 0, (_Bool)0, (_Bool)0},
    (struct device *)0, 0UL, 0, 61441U, 0, 0};
static struct ff_dev *ff_dev_create(void)
{
  struct ff_dev *ff ;
  struct fmc_device *fmc ;
  int i ;
  int ret ;
  void *tmp ;
  void *tmp___0 ;
  void *tmp___1 ;
  void *tmp___2 ;
  {
  tmp = kzalloc(1448UL, 208U);
  ff = (struct ff_dev *)tmp;
  if ((unsigned long )ff == (unsigned long )((struct ff_dev *)0)) {
    tmp___0 = ERR_PTR(-12L);
    return ((struct ff_dev *)tmp___0);
  } else {
  }
  dev_set_name(& ff->dev, "fake-fmc-carrier");
  ff->dev.release = & ff_dev_release;
  ret = device_register(& ff->dev);
  if (ret < 0) {
    put_device(& ff->dev);
    tmp___1 = ERR_PTR((long )ret);
    return ((struct ff_dev *)tmp___1);
  } else {
  }
  i = 0;
  goto ldv_19595;
  ldv_19594:
  tmp___2 = kmemdup((void const *)(& ff_template_fmc), 1592UL, 208U);
  fmc = (struct fmc_device *)tmp___2;
  fmc->hwdev = & ff->dev;
  fmc->carrier_data = (void *)ff;
  fmc->nr_slots = ff_nr_dev;
  fmc->eeprom = (uint8_t *)(& ff_eeimg) + (unsigned long )i;
  fmc->eeprom_addr = (i + 40) * 2;
  fmc->slot_id = i;
  ff->fmc[i] = fmc;
  ff_template_fmc.device_id = ff_template_fmc.device_id + 1U;
  i = i + 1;
  ldv_19595: ;
  if (i < ff_nr_dev) {
    goto ldv_19594;
  } else {
  }
  return (ff);
}
}
static int ff_init(void)
{
  struct ff_dev *ff ;
  struct firmware const *fw ;
  int i ;
  int len ;
  int ret ;
  size_t __len ;
  void *__ret ;
  long tmp ;
  bool tmp___0 ;
  size_t tmp___1 ;
  size_t __min1 ;
  size_t __min2 ;
  size_t __len___0 ;
  void *__ret___0 ;
  {
  ret = 0;
  i = 1;
  goto ldv_19609;
  ldv_19608:
  __len = 8192UL;
  if (__len > 63UL) {
    __ret = memcpy((void *)(& ff_eeimg) + (unsigned long )i, (void const *)(& ff_eeimg),
                     __len);
  } else {
    __ret = memcpy((void *)(& ff_eeimg) + (unsigned long )i, (void const *)(& ff_eeimg),
                             __len);
  }
  i = i + 1;
  ldv_19609: ;
  if (i <= 3) {
    goto ldv_19608;
  } else {
  }
  if (ff_nr_eeprom > ff_nr_dev) {
    ff_nr_dev = ff_nr_eeprom;
  } else {
  }
  ff = ff_dev_create();
  tmp___0 = IS_ERR((void const *)ff);
  if ((int )tmp___0) {
    tmp = PTR_ERR((void const *)ff);
    return ((int )tmp);
  } else {
  }
  i = 0;
  goto ldv_19619;
  ldv_19618:
  tmp___1 = strlen((char const *)ff_eeprom[i]);
  if (tmp___1 == 0UL) {
    goto ldv_19611;
  } else {
  }
  ret = request_firmware(& fw, (char const *)ff_eeprom[i], & ff->dev);
  if (ret < 0) {
    dev_err((struct device const *)(& ff->dev), "Mezzanine %i: can\'t load \"%s\" (error %i)\n",
            i, ff_eeprom[i], - ret);
  } else {
    __min1 = fw->size;
    __min2 = 8192UL;
    len = (int )(__min1 < __min2 ? __min1 : __min2);
    __len___0 = (size_t )len;
    __ret___0 = memcpy((void *)(& ff_eeimg) + (unsigned long )i, (void const *)fw->data,
                                 __len___0);
    release_firmware(fw);
    _dev_info((struct device const *)(& ff->dev), "Mezzanine %i: eeprom \"%s\"\n",
              i, ff_eeprom[i]);
  }
  ldv_19611:
  i = i + 1;
  ldv_19619: ;
  if (i < ff_nr_eeprom) {
    goto ldv_19618;
  } else {
  }
  ret = fmc_device_register_n((struct fmc_device **)(& ff->fmc), ff_nr_dev);
  if (ret != 0) {
    device_unregister(& ff->dev);
    return (ret);
  } else {
  }
  ff_current_dev = ff;
  return (ret);
}
}
static void ff_exit(void)
{
  {
  if ((unsigned long )ff_current_dev != (unsigned long )((struct ff_dev *)0)) {
    fmc_device_unregister_n((struct fmc_device **)(& ff_current_dev->fmc), ff_nr_dev);
    device_unregister(& ff_current_dev->dev);
  } else {
  }
  cancel_delayed_work_sync(& ff_work);
  return;
}
}
int ldv_retval_0 ;
extern int ldv_probe_1(void) ;
extern void ldv_initialize(void) ;
extern void ldv_check_final_state(void) ;
irqreturn_t (*ldvarg12)(int , void * ) ;
extern int ldv_release_1(void) ;
void ldv_initialize_fmc_operations_1(void)
{
  void *tmp ;
  void *tmp___0 ;
  {
  tmp = ldv_zalloc(568UL);
  ff_fmc_operations_group0 = (struct fmc_driver *)tmp;
  tmp___0 = ldv_zalloc(1592UL);
  ff_fmc_operations_group1 = (struct fmc_device *)tmp___0;
  return;
}
}
int main(void)
{
  char *ldvarg11 ;
  void *tmp ;
  int ldvarg7 ;
  int tmp___0 ;
  char *ldvarg3 ;
  void *tmp___1 ;
  int ldvarg0 ;
  int tmp___2 ;
  void *ldvarg5 ;
  void *tmp___3 ;
  int ldvarg6 ;
  int tmp___4 ;
  void *ldvarg8 ;
  void *tmp___5 ;
  uint32_t ldvarg1 ;
  int ldvarg4 ;
  int tmp___6 ;
  int ldvarg10 ;
  int tmp___7 ;
  int ldvarg9 ;
  int tmp___8 ;
  int ldvarg2 ;
  int tmp___9 ;
  struct work_struct *ldvarg14 ;
  void *tmp___10 ;
  unsigned long ldvarg13 ;
  unsigned long tmp___11 ;
  int tmp___12 ;
  int tmp___13 ;
  int tmp___14 ;
  int tmp___15 ;
  {
  tmp = ldv_zalloc(1UL);
  ldvarg11 = (char *)tmp;
  tmp___0 = __VERIFIER_nondet_int();
  ldvarg7 = tmp___0;
  tmp___1 = ldv_zalloc(1UL);
  ldvarg3 = (char *)tmp___1;
  tmp___2 = __VERIFIER_nondet_int();
  ldvarg0 = tmp___2;
  tmp___3 = ldv_zalloc(1UL);
  ldvarg5 = tmp___3;
  tmp___4 = __VERIFIER_nondet_int();
  ldvarg6 = tmp___4;
  tmp___5 = ldv_zalloc(1UL);
  ldvarg8 = tmp___5;
  tmp___6 = __VERIFIER_nondet_int();
  ldvarg4 = tmp___6;
  tmp___7 = __VERIFIER_nondet_int();
  ldvarg10 = tmp___7;
  tmp___8 = __VERIFIER_nondet_int();
  ldvarg9 = tmp___8;
  tmp___9 = __VERIFIER_nondet_int();
  ldvarg2 = tmp___9;
  tmp___10 = ldv_zalloc(80UL);
  ldvarg14 = (struct work_struct *)tmp___10;
  tmp___11 = __VERIFIER_nondet_ulong();
  ldvarg13 = tmp___11;
  ldv_initialize();
  memset((void *)(& ldvarg1), 0, 4UL);
  ldv_state_variable_1 = 0;
  ref_cnt = 0;
  ldv_state_variable_0 = 1;
  ldv_state_variable_2 = 0;
  ldv_19700:
  tmp___12 = __VERIFIER_nondet_int();
  switch (tmp___12) {
  case 0: ;
  if (ldv_state_variable_1 != 0) {
    tmp___13 = __VERIFIER_nondet_int();
    switch (tmp___13) {
    case 0: ;
    if (ldv_state_variable_1 == 1) {
      ff_validate(ff_fmc_operations_group1, ff_fmc_operations_group0);
      ldv_state_variable_1 = 1;
    } else {
    }
    if (ldv_state_variable_1 == 2) {
      ff_validate(ff_fmc_operations_group1, ff_fmc_operations_group0);
      ldv_state_variable_1 = 2;
    } else {
    }
    goto ldv_19677;
    case 1: ;
    if (ldv_state_variable_1 == 1) {
      ff_irq_request(ff_fmc_operations_group1, ldvarg12, ldvarg11, ldvarg10);
      ldv_state_variable_1 = 1;
    } else {
    }
    if (ldv_state_variable_1 == 2) {
      ff_irq_request(ff_fmc_operations_group1, ldvarg12, ldvarg11, ldvarg10);
      ldv_state_variable_1 = 2;
    } else {
    }
    goto ldv_19677;
    case 2: ;
    if (ldv_state_variable_1 == 2) {
      ff_write_ee(ff_fmc_operations_group1, ldvarg9, (void const *)ldvarg8, ldvarg7);
      ldv_state_variable_1 = 2;
    } else {
    }
    goto ldv_19677;
    case 3: ;
    if (ldv_state_variable_1 == 2) {
      ff_read_ee(ff_fmc_operations_group1, ldvarg6, ldvarg5, ldvarg4);
      ldv_state_variable_1 = 2;
    } else {
    }
    goto ldv_19677;
    case 4: ;
    if (ldv_state_variable_1 == 1) {
      ff_reprogram(ff_fmc_operations_group1, ff_fmc_operations_group0, ldvarg3);
      ldv_state_variable_1 = 1;
    } else {
    }
    if (ldv_state_variable_1 == 2) {
      ff_reprogram(ff_fmc_operations_group1, ff_fmc_operations_group0, ldvarg3);
      ldv_state_variable_1 = 2;
    } else {
    }
    goto ldv_19677;
    case 5: ;
    if (ldv_state_variable_1 == 1) {
      ff_readl(ff_fmc_operations_group1, ldvarg2);
      ldv_state_variable_1 = 1;
    } else {
    }
    if (ldv_state_variable_1 == 2) {
      ff_readl(ff_fmc_operations_group1, ldvarg2);
      ldv_state_variable_1 = 2;
    } else {
    }
    goto ldv_19677;
    case 6: ;
    if (ldv_state_variable_1 == 1) {
      ff_writel(ff_fmc_operations_group1, ldvarg1, ldvarg0);
      ldv_state_variable_1 = 1;
    } else {
    }
    if (ldv_state_variable_1 == 2) {
      ff_writel(ff_fmc_operations_group1, ldvarg1, ldvarg0);
      ldv_state_variable_1 = 2;
    } else {
    }
    goto ldv_19677;
    case 7: ;
    if (ldv_state_variable_1 == 2) {
      ldv_release_1();
      ldv_state_variable_1 = 1;
      ref_cnt = ref_cnt - 1;
    } else {
    }
    goto ldv_19677;
    case 8: ;
    if (ldv_state_variable_1 == 1) {
      ldv_probe_1();
      ldv_state_variable_1 = 2;
      ref_cnt = ref_cnt + 1;
    } else {
    }
    goto ldv_19677;
    default:
    ldv_stop();
    }
    ldv_19677: ;
  } else {
  }
  goto ldv_19687;
  case 1: ;
  if (ldv_state_variable_0 != 0) {
    tmp___14 = __VERIFIER_nondet_int();
    switch (tmp___14) {
    case 0: ;
    if (ldv_state_variable_0 == 3 && ref_cnt == 0) {
      ff_exit();
      ldv_state_variable_0 = 2;
      goto ldv_final;
    } else {
    }
    goto ldv_19691;
    case 1: ;
    if (ldv_state_variable_0 == 1) {
      ldv_retval_0 = ff_init();
      if (ldv_retval_0 == 0) {
        ldv_state_variable_0 = 3;
        ldv_state_variable_2 = 1;
        ldv_state_variable_1 = 1;
        ldv_initialize_fmc_operations_1();
      } else {
      }
      if (ldv_retval_0 != 0) {
        ldv_state_variable_0 = 2;
        goto ldv_final;
      } else {
      }
    } else {
    }
    goto ldv_19691;
    default:
    ldv_stop();
    }
    ldv_19691: ;
  } else {
  }
  goto ldv_19687;
  case 2: ;
  if (ldv_state_variable_2 != 0) {
    tmp___15 = __VERIFIER_nondet_int();
    switch (tmp___15) {
    case 0: ;
    if (ldv_state_variable_2 == 1) {
      ff_work_fn(ldvarg14);
      ldv_state_variable_2 = 1;
    } else {
    }
    goto ldv_19696;
    case 1: ;
    if (ldv_state_variable_2 == 1) {
      delayed_work_timer_fn(ldvarg13);
      ldv_state_variable_2 = 1;
    } else {
    }
    goto ldv_19696;
    default:
    ldv_stop();
    }
    ldv_19696: ;
  } else {
  }
  goto ldv_19687;
  default:
  ldv_stop();
  }
  ldv_19687: ;
  goto ldv_19700;
  ldv_final:
  ldv_check_final_state();
  return 0;
}
}
void *ldv_kmem_cache_alloc_16(struct kmem_cache *ldv_func_arg1 , gfp_t flags )
{
  {
  ldv_check_alloc_flags(flags);
  kmem_cache_alloc(ldv_func_arg1, flags);
  return ((void *)0);
}
}
void *ldv_zalloc(size_t size ) ;
__inline static void *kzalloc(size_t size , gfp_t flags )
{
  {
  ldv_check_alloc_flags(flags);
  return ((void *)0);
}
}
__inline static void ldv_error(void);
int ldv_spin = 0;
void ldv_check_alloc_flags(gfp_t flags )
{
  {
  if (ldv_spin == 0 || ! (flags & 16U)) {
  } else {
    ldv_error();
  }
  return;
}
}
extern struct page___0 *ldv_some_page(void) ;
struct page___0 *ldv_check_alloc_flags_and_return_some_page(gfp_t flags )
{
  struct page___0 *tmp ;
  {
  if (ldv_spin == 0 || ! (flags & 16U)) {
  } else {
    ldv_error();
  }
  tmp = ldv_some_page();
  return (tmp);
}
}
void ldv_check_alloc_nonatomic(void)
{
  {
  if (ldv_spin == 0) {
  } else {
    ldv_error();
  }
  return;
}
}
void ldv_spin_lock(void)
{
  {
  ldv_spin = 1;
  return;
}
}
void ldv_spin_unlock(void)
{
  {
  ldv_spin = 0;
  return;
}
}
int ldv_spin_trylock(void)
{
  int is_lock ;
  {
  is_lock = ldv_undef_int();
  if (is_lock) {
    return (0);
  } else {
    ldv_spin = 1;
    return (1);
  }
}
}
int __VERIFIER_nondet_int(void);
int _dev_info(const struct device *arg0, const char *arg1, ...) {
  return __VERIFIER_nondet_int();
}
bool __VERIFIER_nondet_bool(void);
bool cancel_delayed_work_sync(struct delayed_work *arg0) {
  return __VERIFIER_nondet_bool();
}
void delayed_work_timer_fn(unsigned long arg0) {
  return;
}
int __VERIFIER_nondet_int(void);
int dev_err(const struct device *arg0, const char *arg1, ...) {
  return __VERIFIER_nondet_int();
}
int __VERIFIER_nondet_int(void);
int dev_set_name(struct device *arg0, const char *arg1, ...) {
  return __VERIFIER_nondet_int();
}
int __VERIFIER_nondet_int(void);
int dev_warn(const struct device *arg0, const char *arg1, ...) {
  return __VERIFIER_nondet_int();
}
int __VERIFIER_nondet_int(void);
int device_register(struct device *arg0) {
  return __VERIFIER_nondet_int();
}
void device_unregister(struct device *arg0) {
  return;
}
int __VERIFIER_nondet_int(void);
int fmc_device_register_n(struct fmc_device **arg0, int arg1) {
  return __VERIFIER_nondet_int();
}
void fmc_device_unregister_n(struct fmc_device **arg0, int arg1) {
  return;
}
void *external_alloc(void);
void *kmem_cache_alloc(struct kmem_cache *arg0, gfp_t arg1) {
  return (void *)external_alloc();
}
void *external_alloc(void);
void *kmemdup(const void *arg0, size_t arg1, gfp_t arg2) {
  return (void *)external_alloc();
}
void ldv_check_final_state() {
  return;
}
void ldv_initialize() {
  return;
}
int __VERIFIER_nondet_int(void);
int ldv_probe_1() {
  return __VERIFIER_nondet_int();
}
int __VERIFIER_nondet_int(void);
int ldv_release_1() {
  return __VERIFIER_nondet_int();
}
void *external_alloc(void);
struct page___0 *ldv_some_page() {
  return (struct page___0 *)external_alloc();
}
int __VERIFIER_nondet_int(void);
int printk(const char *arg0, ...) {
  return __VERIFIER_nondet_int();
}
void put_device(struct device *arg0) {
  return;
}
bool __VERIFIER_nondet_bool(void);
bool queue_delayed_work_on(int arg0, struct workqueue_struct *arg1, struct delayed_work *arg2, unsigned long arg3) {
  return __VERIFIER_nondet_bool();
}
void release_firmware(const struct firmware *arg0) {
  return;
}
int __VERIFIER_nondet_int(void);
int request_firmware(const struct firmware **arg0, const char *arg1, struct device *arg2) {
  return __VERIFIER_nondet_int();
}
void *__VERIFIER_nondet_pointer(void);
void *external_alloc(void) {
  return __VERIFIER_nondet_pointer();
}
void free(void *);
void kfree(void const *p) {
  free((void *)p);
}
