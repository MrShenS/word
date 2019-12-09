package com.briup

import org.apache.spark.storage.StorageLevel
import org.apache.spark.{SparkConf, SparkContext}

object FirstSpark {
  def main(args: Array[String]): Unit = {
    //1.自己创建SparkContext或者是SparkSession
    val conf=new SparkConf();
//    conf.setMaster("local[*]")
//    conf.setAppName("First Spark ...")

    conf.set("spark.master","local[*]")
    conf.set("spark.app.name","First Spark");
//    val sc=new SparkContext(conf);
    val sc=SparkContext.getOrCreate(conf);
    println(sc);

    val info=sc.textFile("/opt/spark/README.md");
    val word=info.flatMap(_.split(" "));

    word.cache();
    word.persist()
    word.persist(StorageLevel.MEMORY_AND_DISK)
    word.countByValue();

    //2.关闭spark
    sc.stop();
  }
}


spark-submit  -master local[1] -class  org.apache.spark.examples.SparkPi home/sz/software/spark/examples/jars/spark-examples_2.11-2.4.3.jar


spark-submit -master local[1] -Class org.apache.spark.examples.SparkPi /software/spark/examples/jars/spark-examples_2.11-2.4.3.jar 

import org.apache.spark.examples

  val info=sc.textFile("/home/sz/data/test");

