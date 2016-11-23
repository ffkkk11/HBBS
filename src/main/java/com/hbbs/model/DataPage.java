package com.hbbs.model;

/**
 * Created by Hua on 2016/10/29.
 */
public class DataPage {

    private int index = 1; // 当前页
    private int size = 10; // 每页几条
    private int max = 0; // 最大页数 (count-1)/size + 1
    private long count = 0;// 记录数

    private String sort; //排序字段
    private String order = "desc"; //排序

    /**
     * 获得分页的起始行索引号
     * @return 返回int类型的起始索引号
     */
    public int getStart() {
        return this.getSize() * (this.getIndex() - 1);
    }

    /**
     * 设置当前页码
     * @param index
     */
    public void setIndex(int index) {
        if(index > 0) {
            this.index = index;
        } else {
            this.index = 1;
        }
    }

    /**
     * 设置每页几条
     * @param size 页量
     */
    public void setSize(int size) {
        this.size = size;
    }

    /**
     * 设置记录总数
     * @param count 记录数
     */
    public void setCount(long count) {
        this.count = count;
        this.max = (int)(this.count % this.size == 0 ? this.count / this.size
                : this.count / this.size + 1);

        if (this.max > 0)
            if (this.index > this.max)
                this.index = this.max;
    }

    /**
     * 设置最大页数
     * @param max 最大页数
     */
    public void setMax(int max) {
        this.max = max;
    }

    /**
     * 获取当前页
     *
     * @return 当前页
     */
    public int getIndex() {
        return index;
    }

    /**
     * 获取每页条数
     *
     * @return 每页条数
     */
    public int getSize() {
        return size;
    }

    /**
     * 获取最大页数
     *
     * @return 最大页数
     */
    public int getMax() {
        return max;
    }

    /**
     * 获取记录数
     *
     * @return 记录数
     */
    public long getCount() {
        return count;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }
}
