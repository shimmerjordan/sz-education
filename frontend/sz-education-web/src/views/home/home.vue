<template>
  <div>
    <el-row class="hero-area" type="flex" justify="center" align="middle">
      <el-col :span="24">
        <div class="hero-content">
          <h2>轼辙云教学平台</h2>
          <h4>轼-车前扶手 辙-车后轮痕</h4>
          <h4>瞻前不忘思过往，方是成大事的模样</h4>
          <router-link to="/courses" class="btn clever-btn">开始使用</router-link>
        </div>
      </el-col>
    </el-row>
    <div class="cool-facts-area padding-80-0">
      <el-row type="flex" justify="center" :gutter="50">
        <el-col :span="4">
          <transition name="fade-transform" mode="out-in">
            <div class="single-cool-facts-area mb-80" v-show="showFacts">
              <div class="icon">
                <img src="static/img/core-img/star.png" alt="">
              </div>
              <h2>
                <count-to :start-val="0" :end-val="187" :duration="2600" class="counter"/>
              </h2>
              <h5>用户数</h5>
            </div>
          </transition>
        </el-col>
        <el-col :span="4">
          <transition name="fade-transform" mode="out-in">
            <div class="single-cool-facts-area mb-80" v-show="showFacts">
              <div class="icon">
                <img src="static/img/core-img/star.png" alt="">
              </div>
              <h2>
                <count-to :start-val="0" :end-val="500" :duration="2600" class="counter"/>
              </h2>
              <h5>考试数</h5>
            </div>
          </transition>
        </el-col>
        <el-col :span="4">
          <transition name="fade-transform" mode="out-in">
            <div class="single-cool-facts-area mb-80" v-show="showFacts">
              <div class="icon">
                <img src="static/img/core-img/star.png" alt="">
              </div>
              <h2>
                <count-to :start-val="0" :end-val="233" :duration="2600" class="counter"/>
              </h2>
              <h5>题目数</h5>
            </div>
          </transition>
        </el-col>
        <el-col :span="4">
          <transition name="fade-transform" mode="out-in">
            <div class="single-cool-facts-area mb-80" v-show="showFacts">
              <div class="icon">
                <img src="static/img/core-img/star.png" alt="">
              </div>
              <h2>
                <count-to :start-val="0" :end-val="300" :duration="2600" class="counter"/>
              </h2>
              <h5>课程数</h5>
            </div>
          </transition>
        </el-col>
      </el-row>
    </div>

    <div class="popular-courses-area padding-80-0">
      <el-row>
        <el-col :span="24">
          <div class="section-heading">
            <h3>热门课程</h3>
          </div>
        </el-col>
      </el-row>
      <el-row type="flex" justify="center" :gutter="50">
        <el-col :span="6">
          <transition name="fade-transform" mode="out-in">
            <div class="single-popular-course" v-show="showCourses">
              <img src="static/img/bg-img/c1.jpg" alt="">
              <div class="course-content">
                <h4>推荐系统导论</h4>
                <div class="meta d-flex align-items-center">
                  <a href="#">Tanma</a>
                  <span><i class="fa fa-circle" aria-hidden="true"></i></span>
                  <a href="#">人工智能 &amp; 机器学习</a>
                </div>
                <p>涵盖传统以及新兴的深度学习类推荐算法，以及数据清洗、数据挖掘领域的算法。</p>
              </div>
              <div class="seat-rating-fee d-flex justify-content-between">
                <div class="seat-rating h-100 d-flex align-items-center">
                  <div class="seat">
                    <i class="el-icon-user-solid" aria-hidden="true"></i> 10
                  </div>
                  <div class="rating">
                    <i class="el-icon-star-on" aria-hidden="true"></i> 4.5
                  </div>
                </div>
                <div class="course-fee h-100">
                  <a href="#" class="free">免费</a>
                </div>
              </div>
            </div>
          </transition>
        </el-col>
        <el-col :span="6">
          <transition name="fade-transform" mode="out-in">
            <div class="single-popular-course mb-80" v-show="showCourses">
              <img src="static/img/bg-img/c2.jpg" alt="">
              <div class="course-content">
                <h4>词汇</h4>
                <div class="meta d-flex align-items-center">
                  <a href="#">Tanma</a>
                  <span><i class="fa fa-circle" aria-hidden="true"></i></span>
                  <a href="#">艺术 &amp; 设计</a>
                </div>
                <p>专业英语词汇培训辅导班，系统方法帮您高效提升英语词汇培训成绩</p>
              </div>
              <div class="seat-rating-fee d-flex justify-content-between">
                <div class="seat-rating h-100 d-flex align-items-center">
                  <div class="seat">
                    <i class="el-icon-user-solid" aria-hidden="true"></i> 10
                  </div>
                  <div class="rating">
                    <i class="el-icon-star-on" aria-hidden="true"></i> 4.5
                  </div>
                </div>
                <div class="course-fee h-100">
                  <a href="#">免费</a>
                </div>
              </div>
            </div>
          </transition>
        </el-col>
        <el-col :span="6">
          <transition name="fade-transform" mode="out-in">
            <div class="single-popular-course mb-80" v-show="showCourses">
              <img src="static/img/bg-img/c3.jpg" alt="">
              <div class="course-content">
                <h4>说明文写作</h4>
                <div class="meta d-flex align-items-center">
                  <a href="#">Tanma</a>
                  <span><i class="fa fa-circle" aria-hidden="true"></i></span>
                  <a href="#">艺术 &amp; 设计</a>
                </div>
                <p>精选辅导教程，训练学生阅读和写作说明文的能力</p>
              </div>
              <div class="seat-rating-fee d-flex justify-content-between">
                <div class="seat-rating h-100 d-flex align-items-center">
                  <div class="seat">
                    <i class="el-icon-user-solid" aria-hidden="true"></i> 10
                  </div>
                  <div class="rating">
                    <i class="el-icon-star-on" aria-hidden="true"></i> 4.5
                  </div>
                </div>
                <div class="course-fee h-100">
                  <a href="#">免费</a>
                </div>
              </div>
            </div>
          </transition>
        </el-col>
      </el-row>
    </div>

    <div class="blog-area padding-80-0">
      <el-row>
        <el-col :span="24">
          <div class="section-heading">
            <h3>博客分享</h3>
          </div>
        </el-col>
      </el-row>
      <el-row type="flex" justify="center" :gutter="50">
        <el-col :span="10">
          <transition name="fade-transform" mode="out-in">
            <div class="single-blog-area mb-80" v-show="showBlog">
              <img src="static/img/blog-img/1.jpg" alt="">
              <div class="blog-content">
                <a href="https://shimmerjordan.site/2021/03/08/introToSZ-education/" class="blog-headline">
                  <h4>Introduction to sz-education</h4>
                </a>
                <div class="meta d-flex align-items-center">
                  <a href="https://cv.shimmerjordan.site/">shimmerjordan</a>
                  <span><i class="fa fa-circle" aria-hidden="true"></i></span>
                  <a href="https://shimmerjordan.site/tags">技术 &amp; 设计</a>
                </div>
                <p>轼辙云考务系统，实现考试的无纸化以及高效化。</p>
              </div>
            </div>
          </transition>
        </el-col>
        <el-col :span="10">
          <transition name="fade-transform" mode="out-in">
            <div class="single-blog-area mb-80" v-show="showBlog">
              <img src="static/img/blog-img/2.jpg" alt="">
              <div class="blog-content">
                <a href="https://shimmerjordan.site/2021/01/08/addTwoNumbers/" class="blog-headline">
                  <h4>Add Two Numbers</h4>
                </a>
                <div class="meta d-flex align-items-center">
                  <a href="https://cv.shimmerjordan.site/">shimmerjordan</a>
                  <span><i class="fa fa-circle" aria-hidden="true"></i></span>
                  <a href="https://shimmerjordan.site/tags">算法 &amp; 设计</a>
                </div>
                <p>什么是两数相加最好的策略？如果考虑溢出问题，传统算术真的可行吗？</p>
              </div>
            </div>
          </transition>
        </el-col>
      </el-row>
    </div>
    <div v-if="isActive" class="go-top-box" @click="goTop(step)">
      <i class="top-icon el-icon-caret-top"></i>
    </div>
    <o-footer></o-footer>
  </div>
</template>

<script>
import OFooter from '../common/footer'
import CountTo from 'vue-count-to'

export default {
  props: {
    step: {
      type: Number,
      default: 50
    }
  },
  data () {
    return {
      isActive: false,
      showFacts: false,
      showCourses: false,
      showBlog: false
    }
  },
  components: {
    OFooter,
    CountTo
  },
  methods: {
    // 返回顶部
    goTop: function (i) {
      document.documentElement.scrollTop -= i
      if (document.documentElement.scrollTop > 0) {
        setTimeout(() => this.goTop(i), 16)
      }
    }
  },
  created () {
    let vm = this
    window.onscroll = function () {
      vm.isActive = document.documentElement.scrollTop > 60
      if (document.documentElement.scrollTop > 250) {
        setTimeout(() => {
          vm.showCourses = true
        }, 350)
      }

      if (document.documentElement.scrollTop > 650) {
        setTimeout(() => {
          vm.showBlog = true
        }, 350)
      }
    }
    setTimeout(() => {
      vm.showFacts = true
    }, 350)
  }
}
</script>
