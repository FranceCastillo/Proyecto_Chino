<?php
/**
 * Logs to every row who created and who updated it. This may interests you when working in a group of
 * more people sharing same privileges.
 *
 * @copyright mintao GmbH & Co. KG
 * @author Florian Fackler <florian.fackler@mintao.com>
 * @license MIT <http://www.opensource.org/licenses/mit-license.php>
 * @package Yii framework
 * @subpackage db-behavior
 * @version 0.1 Beta
 */

class BlameableBehavior extends CActiveRecordBehavior
{
    /**
     * @param string $createdByColumn Name of the column in the table where to write the creater user name
     */
    public $createdByColumn = 'created_by';

    /**
     * @param string $updatedByColumn Name of the column in the table where to write the updater user name
     */
    public $updatedByColumn = 'updated_by';


    public function beforeValidate($event)
    {
        if(isset(Yii::app()->user)) {
            
            $availableColumns = array_keys($this->owner->tableSchema->columns);
            
            if($this->owner->isNewRecord && empty($this->owner->{$this->createdByColumn}))
                if(in_array($this->createdByColumn, $availableColumns))
                    $this->owner->{$this->createdByColumn} = Yii::app()->user->name;
            
            if(empty($this->owner->{$this->updatedByColumn}))
                if(in_array($this->updatedByColumn, $availableColumns))
                    $this->owner->{$this->updatedByColumn} = Yii::app()->user->name;
        }
        return parent::beforeValidate($event);
    }
}
