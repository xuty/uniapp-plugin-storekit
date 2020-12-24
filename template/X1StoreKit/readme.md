###简介：
Appstore评分
###API
模块名: Xty-StoreKit
方法列表:
review() 弹出评分框
###使用示例:
```
<template>
    <view class="content">
       <button @tap="onclick">点击评论</button> </view>
</template>
<script>
const storeKit = uni.requireNativePlugin('Xty-StoreKit');
export default {
    data() {
        return {
        },
    methods: {
        onclick : function(){
            storeKit.review();
        }
    }
}
</script>
```
